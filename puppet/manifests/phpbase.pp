# Enable XDebug ("0" | "1")
$use_xdebug = "0"

# Default path
Exec 
{
  path => ["/usr/bin", "/bin", "/usr/sbin", "/sbin", "/usr/local/bin", "/usr/local/sbin"]
}

exec 
{ 
    'apt-get update':
        command => '/usr/bin/apt-get update',
        require => Exec['add php54 apt-repo']
}

include bootstrap
include other
include apache
include php54 #specific setup steps for 5.4
include php
include mysql
include phpmyadmin
include beanstalkd
include redis
include memcached

include laravel_app
