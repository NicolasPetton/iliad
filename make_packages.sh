#!/bin/bash

GST_PACK="/usr/bin/env gst-package"

CURR_DIR=`pwd`
echo "Packaging in $CURR_DIR ..." > make_packages.log
for i in `find . -name package.xml`
do
    echo "packaging $i ..."
    $GST_PACK -t ~/.st $i >> make_packages.log
done

if [ -d More/UI ]; then
	for i in `find More/UI/stylesheets -type f | grep -v '\.svn'`
		do
    		echo "linking $i to Public..."
			ln -fs ../../$i Public/stylesheets/
	done
	for i in `find More/UI/images -type f | grep -v '\.svn'`
		do
    		echo "linking $i to Public..."
			ln -fs ../../$i Public/images/
	done
fi

