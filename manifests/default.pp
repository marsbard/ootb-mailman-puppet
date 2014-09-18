
$mailman_passwd = "m41lmAnzP455word_"
$mailman_smtp_host = "lists.orderofthebee.org"
$mailman_http_host = "lists.orderofthebee.org"



# fix locales
exec{ "fix-locales":
    command => "locale-gen en_GB.UTF-8",
    path => "/usr/sbin:/bin",
}
exec{ "dpkg-reconfigure locales":
    path => "/bin:/usr/bin:/usr/sbin",
    require => Exec["fix-locales"],
}


include "apache-local"
include "mailman-local"

