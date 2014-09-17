#!/bin/sh

cd "`dirname $0`"

if [ ! -f "IS_REMOTE" ]
then
    echo 
    echo "Be careful applying this to your local machine, use vagrant instead"
    echo "or else your apache config (if you have one) will be destroyed."
    echo
    echo "If this really is the remote machine, then issue the following command:"
    echo
    echo "  touch `pwd`/IS_REMOTE"
    echo
    exit
fi


./install-puppet-modules.sh

sudo puppet apply -v -d --modulepath="./modules:./extmodules" manifests/default.pp
