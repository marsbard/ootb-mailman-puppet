#!/bin/bash

TGTDIR=extmodules

cd "`dirname $0`"

puppet module install --force thias-mailman --target-dir $TGTDIR
puppet module install --force puppetlabs-apache --target-dir $TGTDIR
