#!/usr/bin/env bash
set -e

#Due to limitations of Docker Machine on MacOS and Windows, the dir must be under user home dir.
#See https://docs.docker.com/engine/userguide/containers/dockervolumes/
HOST_DIR="/c/Users/max/maps"

#build docker image using instructions on ./Dockerfile and name it web-geo
docker build -t web-geo .

#start transient container from web-geo image and run conversion instructions inside it, results go to the HOST_DIR
docker run --rm -v ${HOST_DIR}:/host web-geo "topojson -o /host/rf_adm0_topo.json -q 1e5 -s --no-stitch-poles -- /var/maps/shp/RUS_adm0.shp"
docker run --rm -v ${HOST_DIR}:/host web-geo "topojson -o /host/rf_adm1_topo.json -q 1e5 -s --no-stitch-poles -- /var/maps/shp/RUS_adm1.shp"
docker run --rm -v ${HOST_DIR}:/host web-geo "topojson -o /host/rf_adm2_topo.json -q 1e5 -s --no-stitch-poles -- /var/maps/shp/RUS_adm2.shp"
docker run --rm -v ${HOST_DIR}:/host web-geo "topojson -o /host/rf_adm3_topo.json -q 1e5 -s --no-stitch-poles -- /var/maps/shp/RUS_adm3.shp"
