class memcached {
    package { 'memcached':
        ensure => present,
        require => Exec['apt-get update']
    }
}