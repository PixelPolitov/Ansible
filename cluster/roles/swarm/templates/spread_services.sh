#!/bin/sh

SERVICES_TO_MOVE="spo cpo zpo phpo"

for service in $SERVICES_TO_MOVE; do
    docker service update --constraint-add 'node.labels.run_containers==true' ${service}_${service}
done
