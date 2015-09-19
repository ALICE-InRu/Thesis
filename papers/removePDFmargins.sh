#!/bin/bash

if [ $# -ne 1 ]
then
        echo "USAGE: This script needs exactly one paramter: the path to the PDF"
        kill -SIGINT $$
fi

FILE=$1
  
# Process $file
echo $FILE
# Find bounding boxes
pdfcrop --verbose $FILE tmp.pdf | grep "%%HiResBoundingBox:" > bbox; 
# First page has the largest bounding box
largest=`echo $(head -n 1 bbox)| cut -d':' -f 2` 
# Crop $file
pdfcrop $FILE tmp.pdf --bbox "$largest"
mv tmp.pdf $FILE
rm bbox
