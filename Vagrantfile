# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.define :laravel4 do |lv4_config|
        lv4_config.vm.box = "precise32"
        lv4_config.vm.box_url = "http://files.vagrantup.com/precise32.box"
        lv4_config.ssh.forward_agent = true
        
        # This will give the machine a static IP uncomment to enable
        # lv4_config.vm.network :private_network, ip: "192.168.56.101"
        
        lv4_config.vm.network :forwarded_port, guest: 80, host: 8888, auto_correct: true
        lv4_config.vm.network :forwarded_port, guest: 3306, host: 8889, auto_correct: true
        lv4_config.vm.network :forwarded_port, guest: 5432, host: 5433, auto_correct: true
        lv4_config.vm.hostname = "laravel"
        lv4_config.vm.synced_folder "www", "/var/www", {:mount_options => ['dmode=777','fmode=777']}
        lv4_config.vm.provision :shell, :inline => "echo \"Europe/London\" | sudo tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata"

        lv4_config.vm.provider :virtualbox do |v|
            v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
            v.customize ["modifyvm", :id, "--memory", "512"]
        end

        lv4_config.vm.provision :puppet do |puppet|
            puppet.manifests_path = "puppet/manifests"
            puppet.manifest_file  = "phpbase.pp"
            puppet.module_path = "puppet/modules"
            #puppet.options = "--verbose --debug"
        end

        lv4_config.vm.provision :shell, :path => "puppet/scripts/enable_remote_mysql_access.sh"
    end
end