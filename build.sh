#!/bin/sh

moved=0
log=compile_err.log
dev=scripts/


rm -rf $log
rm $dev*.js 2> /dev/null

echo 'compiling..'
coffee -c $dev* > $log
if [[ -s $log ]] ; then
    echo "failed! go see $log"
    exit 1;
else
    rm -rf $log
fi 

find $dev. -name '*.js' -exec mv {} src/. \;

moved=`ls $dev | wc -l | tr -s " "`
echo "succesfully complied$moved files"
