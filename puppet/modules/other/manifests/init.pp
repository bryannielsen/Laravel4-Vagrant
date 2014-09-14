class other 
{
    package 
    { 
        "curl":
            ensure  => present,
            require => Exec['apt-get update']
    }
    package 
    { 
        "sqlite":
            ensure  => present,
            require => Exec['apt-get update']
    }
}
