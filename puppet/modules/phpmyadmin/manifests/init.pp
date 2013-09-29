class phpmyadmin 
{
    package 
    { 
        "phpmyadmin":
            ensure  => present,
            require => [
                Exec['apt-get update'],
                Package["php5", "php5-mysql", "apache2"],
            ]
    }
  
    file 
    { 
        "/etc/apache2/conf-enabled/phpmyadmin.conf":
            ensure => link,
            target => "/etc/phpmyadmin/apache.conf",
            require => Package['apache2'],
            notify => Service["apache2"]
    }

    file 
    { 
        "/etc/phpmyadmin/config.inc.php":
            ensure  => present,
            owner => root, group => root,
            mode => '0775',
            notify  => Service['apache2'],
            source  => "/vagrant/puppet/modules/phpmyadmin/templates/config.inc.php",
            require => [Package['phpmyadmin'], Package['apache2']],
    }
}
