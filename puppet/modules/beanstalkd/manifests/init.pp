class beanstalkd {
    package { 'beanstalked':
        ensure => present,
        require => Exec['apt-get update']
    }
}