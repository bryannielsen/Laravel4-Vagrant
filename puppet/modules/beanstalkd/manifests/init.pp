class beanstalkd {
    package { 'beanstalkd':
        ensure => present,
        require => Exec['apt-get update']
    }
}