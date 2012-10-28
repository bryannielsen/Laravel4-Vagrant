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
        "/etc/apache2/conf.d/phpmyadmin.conf":
            ensure => link,
            target => "/etc/phpmyadmin/apache.conf",
            require => Package['apache2'],
            notify => Service["apache2"]
    }  
}
