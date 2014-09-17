class apache-local {

    # https://forge.puppetlabs.com/puppetlabs/apache
    class { 'apache':
      default_mods        => false,
        default_confd_files => false,
    }

    apache::vhost { "lists.orderofthebee.org":
        port => 80,
        docroot => "/var/www/lists.orderofthebee.org",
    }

    

}
