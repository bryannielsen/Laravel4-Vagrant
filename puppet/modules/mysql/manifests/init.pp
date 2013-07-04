class mysql 
{
    $mysqlPassword = ""
 
    package 
    { 
        "mysql-server":
            ensure  => present,
            require => Exec['apt-get update']
    }

    service 
    { 
        "mysql":
            enable => true,
            ensure => running,
            require => Package["mysql-server"],
    }

    # Make sure that any previously setup boxes are gracefully 
    # transitioned to the new empty root password.
    exec
    {
    	"set-mysql-password":
            onlyif => "mysqladmin -uroot -proot status",
            command => "mysqladmin -uroot -proot password $mysqlPassword",
            require => Service["mysql"],
    }

    exec 
    { 
        "create-default-db":
            unless => "/usr/bin/mysql -uroot -p$mysqlPassword database",
            command => "/usr/bin/mysql -uroot -p$mysqlPassword -e 'create database `database`;'",
            require => [Service["mysql"], Exec["set-mysql-password"]]
    }

    exec 
    { 
        "grant-default-db":
            command => "/usr/bin/mysql -uroot -p$mysqlPassword -e 'grant all on `database`.* to `root@localhost`;'",
            require => [Service["mysql"], Exec["create-default-db"]]
    }
}
