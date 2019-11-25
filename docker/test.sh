#!/bin/bash

if docker ps | grep -q docker_grafana_1
then
    echo "Grafana is running"
else
    docker-compose up -d
fi

if docker ps | grep -q docker_graphite_1
then
    echo "Graphite is running"
else
    docker-compose up -d
fi

while true
do
    docker-compose run sitespeed.io https://www.x-kom.pl https://www.allegro.pl https://www.amazon.de https://www.limango.pl https://www.onet.pl https://www.zalando.pl --graphite.host=graphite
    sleep 600
done
