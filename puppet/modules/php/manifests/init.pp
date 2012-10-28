class php 
{
    $packages = [
        "php5", 
        "php5-cli", 
        "php5-mysql", 
        "php-pear", 
        "php5-dev", 
        "php-apc", 
        "php5-mcrypt", 
        "php5-gd", 
        "php5-curl"
    ]
    
    package 
    { 
        $packages:
            ensure  => latest,
            require => [Exec['apt-get update'], Package['python-software-properties']]
    }
  
    # exec 
    # { 
    #     "sed -i 's|#|//|' /etc/php5/cli/conf.d/mcrypt.ini":
  		#     require => Package['php5'],
    # }

    file 
    { 
        "/etc/php5/fpm/php.ini":
            ensure  => present,
            owner => root, group => root,
            source  => "/vagrant/puppet/templates/php.ini",
            require => Package['php5'],
    }
    
}
