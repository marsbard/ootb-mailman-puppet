class mailman-local{

	user { "mailman": 
	    ensure => present,
	    password => sha1($mailman_passwd),
	    require => Group["mailman"],
	    before => Class["mailman"],

	}

	group { "mailman":
	    ensure => present,
	    before => Class["mailman"],
	}


    package { "postfix":
        ensure => present,
    }

    file { "/etc/aliases":
        ensure => present,
        source => "puppet:///modules/mailman-local/aliases",
        before => Class["mailman"],
        require => Package["postfix"],
    }

    exec { "newaliases":
        path => "/bin:/usr/bin",
        before => Class["mailman"],
        require => File["/etc/aliases"],
    }

# this was the config for thias-mailman
	#class { 'mailman':
	#  default_url_host    => 'lists.orderofthebee.org',
	#  default_email_host  => 'lists.orderofthebee.org',
	#  default_url_pattern => 'https://%s/mailman/',
	#  mailman_site_list   => 'mailman-list',
	#  mm_cfg_settings     => {
	#    'ALLOW_SITE_ADMIN_COOKIES' => 'Yes',
	#    'PUBLIC_ARCHIVE_URL' => "'https://%(hostname)s/pipermail/%(listname)s'",
	#    'MTA' => "'Postfix'",
	#    'POSTFIX_STYLE_VIRTUAL_DOMAINS' => "'False'",
	#    'DEFAULT_SUBJECT_PREFIX' => "''",
	#    'DEFAULT_REPLY_GOES_TO_LIST' => '1',
	#  },
	#}

  class { 'mailman':
    enable_service => true,
      site_pw        => $mailman_passwd,
      mta            => 'Postfix',
      smtp_hostname  => $mailman_smtp_host,
      http_hostname  => $mailman_http_host,
  }

}
