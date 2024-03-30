#!/bin/bash

#
# get URL to download latest GTFS feed
#

RELEASE_URL=$(curl --connect-timeout 30 -s https://www.wroclaw.pl/open-data/dataset/ad52e8db-fc11-4cf0-9b45-3bf4f682c713.jsonld     | \
              jq -r '."@graph"[0]."dcat:accessURL"."@id"'                                                                           | \
              sed -e 's/^"//' -e 's/"$//' -e 's/^\(.*\)\(schedule.*\)$/\2 \1/'                                                      | \
              sort -r                                                                                                               | \
              head -1                                                                                                               | \
              sed -e 's/^\(.*\) \(http.*\)$/\2\1/')

if [ -n "$RELEASE_URL" ]
then
    echo $RELEASE_URL
fi
