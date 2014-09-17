#!/bin/sh

cd "`dirname $0`"

./install-puppet-modules.sh

sudo puppet apply -v -d --modulepath="./modules:./extmodules" manifests/default.pp
