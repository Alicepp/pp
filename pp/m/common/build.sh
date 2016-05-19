#!/bin/bash
VERSION="1.0.0"
LINE="m"
MOD_NAME="common"
dir=`dirname $0`
builddir="../../../build/$LINE"
cd $dir

#删除已经存在的版本
rm -rf $builddir/static/$MOD_NAME

#show emao-plus version
emaop --version --no-color

#build
emaop release -cmopDd $builddir -f fis-online-conf.js

echo "$LINE $MOD_NAME has build end"

exit
