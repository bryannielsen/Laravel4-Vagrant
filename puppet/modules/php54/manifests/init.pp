class php54 
{

	#PHP 5.4 setup 

    package
    {
    	"python-software-properties":
    		ensure => present,
    }

    #https://launchpad.net/~ondrej/+archive/php5
   	exec 
	{ 
	    'add php54 apt-repo':
	        command => '/usr/bin/add-apt-repository ppa:ondrej/php5 -y',
	        require => Package['python-software-properties'],
	}
}
