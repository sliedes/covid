#!/bin/bash

set -e -x

DIR="data"
NOAA="https://www1.ncdc.noaa.gov/pub/data/ghcn/daily/"
CSV_FNAME="COVID-19-geographic-disbtribution-worldwide.csv"

cd "$DIR"

wget --no-verbose -N "$NOAA/readme.txt" "$NOAA/by_year/2020.csv.gz" "$NOAA/ghcnd-stations.txt" "$NOAA/ghcnd-countries.txt"

# wget --no-verbose -N "https://www.ecdc.europa.eu/sites/default/files/documents/$CSV_FNAME"
wget --no-verbose -O "$CSV_FNAME" "https://opendata.ecdc.europa.eu/covid19/casedistribution/csv"
recode l1..u8 "$CSV_FNAME"
