#!/bin/bash

# Name:     Paul Walter
# Date:     Jan 21, 2020
# Purpose:  Progressively create a different api-domain object one by one. 
#           This app allows you to specify which API schema component you
#           wish to scaffold from your Swagger/Openapi3 file
#
#           Here's the example from the website: 
#
#               npx @api-platform/client-generator https://demo.api-platform.com src/ --resource book

#Delegate to the front end Project
./scripts/export-aws-secrets.sh
packer build ./packer/packer.json 
