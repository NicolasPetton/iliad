#!/bin/bash

USAGE=" $0 [-p port]"
NAME=''
NAMESPACE=''
PREREQ=''

if [ $# == 0 ]; then
        echo $USAGE
        exit 1
fi

while getopts p:h o
do        case "$o" in
        p) 	  PORT="$OPTARG";;
        h)    echo "Usage:"
              echo $USAGE
                exit 1;;
        esac
done

echo "building Iliad packages..."
./make_packages.sh
echo "done!"

echo "stopping gst-remote server..."
gst-remote --kill
sleep 2
echo "done!"

echo "building smalltalk image..."
echo "PackageLoader fileInPackage: 'Iliad'. ObjectMemory snapshot: 'iliad.im'" | gst
echo "done!"

echo "starting gst-remote server..."
gst-remote --server -I iliad.im &
sleep 2
echo "done!"

echo "starting Swazoo on port $PORT ..."
gst-remote --eval "Iliad.SwazooIliad startOn: $PORT"
echo "done!"
