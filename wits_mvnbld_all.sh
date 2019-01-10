#!/bin/sh
#
# Witshine
#

cd ..
CURDIR=$(cd `dirname $0`; pwd)
echo $CURDIR

# maven auto build
cd $CURDIR/wits-frameworks/frmwks-basic-commons
mvn clean install
cd $CURDIR/wits-frameworks/frmwks-basic-core
mvn clean install
cd $CURDIR/wits-frameworks/frmwks-basic-expands
mvn clean install
cd $CURDIR/wits-frameworks/frmwks-basic-thdextends
mvn clean install

cd $CURDIR
echo "wits-plusx build success! preparing deploy~~"
