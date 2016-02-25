#Building instructions for docker image. Includes required geo software: gdal, topoJSON nodejs package
FROM debian

RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    gdal-bin \
    nodejs \
    npm \
 && rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install -g topojson

RUN mkdir -p /var/maps/shp
WORKDIR /var/maps/shp

#Russia federation administrative borders from http://www.gadm.org/
RUN wget http://biogeo.ucdavis.edu/data/gadm2.8/shp/RUS_adm_shp.zip
RUN unzip RUS_adm_shp.zip
