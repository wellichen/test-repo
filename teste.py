from pyspark.sql import SparkSession
from pyspark.sql.functions import col
import plotly.graph_objs as go

# Create a SparkSession
spark = SparkSession.builder.appName("DataFrame Execution Plan").getOrCreate()

# Create a sample DataFrame
df = spark.range(1000).withColumn("mod", col("id") % 5)

# Get the execution plan of the DataFrame
plan = df.explain(True)

# Extract the nodes and links from the execution plan
nodes = set()
links = []
for line in plan.split("\n"):
    if line.startswith("#"):
        # Node
        nodes.add(line[2:].strip())
    elif line.startswith("+-") or line.startswith("`-"):
        # Link
        parts = line.split("==")
        links.append({
            "source": parts[0][3:].strip(),
            "target": parts[1].strip(),
        })

# Create a Sankey diagram of the execution plan
fig = go.Figure(data=[go.Sankey(
    node=dict(
        pad=15,
        thickness=20,
        line=dict(color="black", width=0.5),
        label=list(nodes),
    ),
    link=dict(
        source=[list(nodes).index(link["source"]) for link in links],
        target=[list(nodes).index(link["target"]) for link in links],
        value=[1] * len(links),
    )
)])

# Display the diagram
fig.show()
