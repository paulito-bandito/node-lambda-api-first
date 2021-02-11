#!/bin/bash

# Name:     Paul Walter
# Date:     Jan 21, 2020
# Purpose:  Automate the generation of the different formats of the API 

#npm install -g typeorm-model-generator
#typeorm-model-generator -h 0.0.0.0 -d project -u postgres -x thePlacesYouWillGo -e postgres -o . -s dev_schema,end_user_schema --lazy --cp camel --cf pascal --ce pascal --generateConstructor
echo -e "Running ORM Auto-generation...\n \e[32mGreen"
sequelize-auto -o "./entities" -s project_db -d project -h 0.0.0.0 -u project -p 5432 -x password -e postgres -a ./docker/orm/sequelize-config.json -z --camel --typescript --camel-file-name
echo "-----------------"
echo -e "\nIMPORTANT NOTE:"
echo -e "\nDon't forget to inpsect any spatial dataytypes, they won't come out correctly, DataTypes.GEOGRAPHY('POINT', 4326), will be interpreted as DataTypes.ENUM and throw an error\n\n"
