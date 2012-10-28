# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
    config.vm.define :laravel4 do |lv4_config|
        lv4_config.vm.box = "precise32"
        lv4_config.vm.box_url = "http://files.vagrantup.com/precise32.box"
        lv4_config.vm.customize ["modifyvm", :id, "--rtcuseutc", "on"]
        lv4_config.ssh.max_tries = 10
        lv4_config.vm.forward_port 80, 8888
        lv4_config.vm.forward_port 3306, 8889
        lv4_config.vm.host_name = "laravel"
  		lv4_config.vm.share_folder "www", "/var/www", "./www"

  		lv4_config.vm.provision :shell, :inline => "echo \"America/New_York\" | sudo tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata"

        lv4_config.vm.provision :puppet do |puppet|
            puppet.manifests_path = "puppet/manifests"
            puppet.manifest_file  = "phpbase.pp"
            puppet.module_path = "puppet/modules"
            #puppet.options = "--verbose --debug"
            #puppet.options = "--verbose"
        end
        
        lv4_config.vm.provision :shell, :path => "puppet/scripts/enable_remote_mysql_access.sh"
    end
end
