#!/bin/sh

moved=0
log=compile_err.log
dev=scripts/
src=src


rm -rf $log
rm $dev*.js 2> /dev/null

echo 'compiling..'
coffee --bare --compile $dev* > $log 
if [[ -s $log ]] ; then
    echo "failed! go see $log"
    exit 1;
else
    rm -rf $log
fi 

if [ ! -d $src ] ; then
    mkdir $src
fi
find $dev. -name '*.js' -exec mv {} $src/. \;

moved=`ls $dev | wc -l | tr -s " "`
echo "succesfully complied$moved files"
