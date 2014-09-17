class apache-local {

    # https://forge.puppetlabs.com/puppetlabs/apache
    class { 'apache':
      #default_mods        => false,
       # default_confd_files => false,
    }

    apache::vhost { "lists.orderofthebee.org":
        port => 80,
        docroot => "/var/www/lists.orderofthebee.org",
        scriptaliases => [
            {
                alias => "/cgi-bin/mailman",
                path => "/usr/lib/cgi-bin/mailman/",
            }
        ],
        aliases => [
            {
                alias => "/images/mailman",
                path => "/usr/share/images/mailman",

            }
        ],
        directories => [
            {
                path => "/usr/lib/cgi-bin/mailman",
                allowoverride => "None",
                options => ["ExecCGI"],
                addhandlers => [ handler => "cgi-script", extensions => ['.cgi']],
                order => "allow,deny",
                allow => "from all",
            }, 
            {
                path => "/var/lib/mailman/archives/public",
                allowoverride => "None",
                options => ["FollowSymlinks"],
                order => "allow,deny",
                allow => "from all",
            },
            {
                path => "/usr/share/images/mailman",
                allowoverride => "None",
                order => "allow,deny",
                allow => "from all",
            }
        ],
    }

    

}
