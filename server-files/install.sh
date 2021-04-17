#!/bin/sh

# Install required programs
apk add --no-cache screen               # Screen for console access

echo '#/bin/sh' > properties.sh; echo 'set_server_properties() { property_name=$1;property_value=$2;sed -i "s/${property_name}=.*/${property_name}=${property_value}/g" server.properties; }' >> properties.sh; awk -F'[-=.]' '!/#/ {{printf "set_server_properties "}{printf $1}{for(i=2;i<NF;i++){printf "-%s", $i}}{printf " ${"$1}{for(i=2;i<NF;i++){printf "_%s", $i}} if($NF) {printf "-"$NF}{printf "}\n"}}' server.properties >> properties.sh; chmod +x properties.sh