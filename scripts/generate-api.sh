#!/bin/bash

# Name:     Paul Walter
# Date:     Jan 21, 2020
# Purpose:  Automate the generation of the different formats of the API 

BASE_FILE="./openapi/project-api.yaml"
API_FORMATS_PATH="./openapi/api/"

# Create the different formats
cp "${BASE_FILE}" "${API_FORMATS_PATH}/project-swagger2.v1.yaml"
api-spec-converter --from=swagger_2 --to=swagger_2 --syntax=json  "${BASE_FILE}" > "${API_FORMATS_PATH}/project-swagger2.v1.json"
api-spec-converter --from=swagger_2 --to=openapi_3 --syntax=yaml  "${BASE_FILE}" > "${API_FORMATS_PATH}/project-openapi3.v1.yaml"
api-spec-converter --from=swagger_2 --to=openapi_3 --syntax=json  "${BASE_FILE}" > "${API_FORMATS_PATH}/project-openapi3.v1.json"

# Change their permissions so people can actually read them
chmod 755 "${API_FORMATS_PATH}/project-swagger2.v1.yaml"
chmod 755 "${API_FORMATS_PATH}/project-swagger2.v1.json"
chmod 755 "${API_FORMATS_PATH}/project-openapi3.v1.yaml"
chmod 755 "${API_FORMATS_PATH}/project-openapi3.v1.json"