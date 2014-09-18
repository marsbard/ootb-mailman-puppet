ootb-mailman-puppet
===================

Configuration for OOTB mailman server.

To test using vagrant, issue the following commands:

    ./install-puppet-modules.sh
    vagrant up

To install on a remote server, issue

    cd <install path>
    touch IS_REMOTE
    ./apply-puppet.sh





<s>I failed to build groupserver with puppet, then I noticed that puppet has some inbuilt 
type for maillist, currently supporting mailman as a provider.

<s>Also there is this project https://github.com/thias/puppet-mailman which can be used to initialise the provider</s> I changed this to use nwaller-mailman
