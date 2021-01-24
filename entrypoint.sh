#!/bin/bash
sleep 2

cd /home/container

# Replace startup vars
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Execute startup
${MODIFIED_STARTUP}
