#comment
FROM debian

RUN apt-get update && apt-get install -y \
    wget \
    gdal-bin \
    nodejs \
    npm \
 && rm -rf /var/lib/apt/lists/*

RUN npm install -g topojson
