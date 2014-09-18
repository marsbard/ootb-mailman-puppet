class apache-local {

    # https://forge.puppetlabs.com/puppetlabs/apache
    # http://www.howtoforge.com/how-to-install-and-configure-mailman-with-postfix-on-debian-squeeze

    class { 'apache':
      default_mods        => true,
       # default_confd_files => false,
    }

    include "apache::mod::mime"

    apache::vhost { "lists.orderofthebee.org":
        port => 80,
        docroot => "/var/www/lists.orderofthebee.org",
        scriptaliases => [
            {
                alias => "/mailman/",
                path => "/usr/lib/cgi-bin/mailman/",
            },
            {
                alias => "/admin",
                path => "/usr/lib/cgi-bin/mailman/admin",
            },
            {
                alias => "/admindb",
                path => "/usr/lib/cgi-bin/mailman/admindb",
            },
            {
                alias => "/confirm",
                path => "/usr/lib/cgi-bin/mailman/confirm",
            },
            {
                alias => "/create",
                path => "/usr/lib/cgi-bin/mailman/create",
            },
            {
                alias => "/edithtml",
                path => "/usr/lib/cgi-bin/mailman/edithtml",
            },
            {
                alias => "/listinfo",
                path => "/usr/lib/cgi-bin/mailman/listinfo",
            },
            {
                alias => "/options",
                path => "/usr/lib/cgi-bin/mailman/options",
            },
            {
                alias => "/private",
                path => "/usr/lib/cgi-bin/mailman/private",
            },
            {
                alias => "/rmlist",
                path => "/usr/lib/cgi-bin/mailman/rmlist",
            },
            {
                alias => "/roster",
                path => "/usr/lib/cgi-bin/mailman/roster",
            },
            {
                alias => "/subscribe",
                path => "/usr/lib/cgi-bin/mailman/subscribe",
            },
            #{
            #    alias => "/",
            #    path => "/usr/lib/cgi-bin/mailman/listinfo",
            #},
           
        ],
        aliases => [
            {
                alias => "/images/mailman",
                path => "/usr/share/images/mailman",

            }
        ],
        directories => [
            {
                path => "/var/www/lists.orderofthebee.org",
                options => ["FollowSymlinks"],
                order => "allow,deny",
                allow => "from all",            },
            {
                path => "/usr/lib/cgi-bin/mailman",
                allowoverride => "None",
                options => ["ExecCGI", "FollowSymlinks"],
                addhandlers => [{ handler => "cgi-script", extensions => ['.cgi']}],
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
