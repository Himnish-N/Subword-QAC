#!/usr/bin/env bash

set -e

mkdir -p data/aol
cd data/aol

echo "Downloading AOL"
curl --fail -L -O http://www.cim.mcgill.ca/~dudek/206/Logs/AOL-user-ct-collection/aol-data.tar.gz

if [ -f "aol-data.tar.gz" ]; then
    file aol-data.tar.gz # Add this to diagnose file type
    if tar -zxf aol-data.tar.gz; then
        echo "Extraction successful."
        rm aol-data.tar.gz
        if [ -d "AOL-user-ct-collection" ]; then
            mv AOL-user-ct-collection org
            cd org
            gzip -d *.gz
            echo "Happy language modeling and query auto-completion :)"
        else
            echo "Expected directory not found after extraction."
        fi
    else
        echo "Error extracting aol-data.tar.gz. Check file type."
    fi
else
    echo "Failed to download the file. Check URL or network connection."
fi

cd ../../../..
