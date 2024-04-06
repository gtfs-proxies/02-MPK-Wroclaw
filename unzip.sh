#!/bin/bash

FILE_LOCATION=/tmp/$FEED_NAME/original
FEED_FILE=$(ls $FILE_LOCATION | sort -r | head -1)
echo "GTFS_FILE=$FEED_FILE" >> "$GITHUB_OUTPUT"
unzip -o $FILE_LOCATION/$FEED_FILE -d feed/
