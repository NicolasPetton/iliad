#!/bin/bash

GST_PACK="/usr/bin/env gst-package"

CURR_DIR=`pwd`
echo "Packaging in $CURR_DIR ..." > make_packages.log
for i in `find . -name package.xml`
do
    echo "packaging $i ..."
    $GST_PACK -t ~/.st $i >> make_packages.log
done

