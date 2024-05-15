#!/bin/bash

echo $@

# The curl command (using the constructed $parms)
curl $@ --location --request POST 'https://api.createsend.com/api/v3.2/campaigns/c8f321677c3fc38dfe3636f8bc5bb1af.json' \
    --header 'Authorization: Basic dHdQa2xUTXNVTFZ4TlRlZkhQVlFYazhPZTJvemRDOG9LNGlyb3Z0RzR2K052R3dXL01kai9hU2Q3a2dtVjZCZ3VGU2RQZGxBT2NIdjVQVm5nY2lhbTVQVzF6ZWVJdEc1cnBLbWMwbEJubERGdnFXWEYrU2tKMXpJalN6UUF4eGx2TndldXd5bnZic2xWVE9QZk1KbGlBPT06' \
    --header 'Content-Type: application/json' \
    --data-raw '{
      "subject": "Recuerde instalar e3l producto: Pruebasdigiway23@gmail.com",
      "name": "Recuerde instalar el producto 2023121211502295273",
      "fromName": "SUIND",
      "fromEmail": "admin@suind.onmicrosoft.com",
      "replyTo": "admin@suind.onmicrosoft.com",
      "htmlUrl": "https://digiwaycorp.com/wp-content/uploads/2024/02/McAfee-Envio1-1.html",
      "textUrl": null,
      "listIDs": ["0db71c7884d525a62137dddbc676c17c"],
      "segmentIDs": [],
      "tran_transaction_code": null,
      "currentUser": null,
      "currentSesId": null
    }'