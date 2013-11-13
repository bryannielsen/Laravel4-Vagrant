# -*- mode: ruby -*-
# vi: set ft=ruby :

#require "#{File.dirname(__FILE__)}/vagrant/artisan.rb"
#require "#{File.dirname(__FILE__)}/vagrant/composer.rb"

Vagrant.configure("2") do |config|
    config.vm.define :laravel4 do |lv4_config|
        lv4_config.vm.box = "precise32"
        lv4_config.vm.box_url = "http://files.vagrantup.com/precise32.box"
        lv4_config.ssh.forward_agent = true
        lv4_config.vm.network :private_network, ip: "192.168.56.101"
        lv4_config.ssh.forward_agent = true
        lv4_config.vm.network :forwarded_port, guest: 80, host: 8888, auto_correct: true
        lv4_config.vm.network :forwarded_port, guest: 3306, host: 8889, auto_correct: true
        lv4_config.vm.network :forwarded_port, guest: 5432, host: 5433, auto_correct: true
        lv4_config.vm.network :forwarded_port, guest: 80, host: 8888, auto_correct: true
        lv4_config.vm.hostname = "laravel"
        nfs_setting = RUBY_PLATFORM =~ /darwin/ || RUBY_PLATFORM =~ /linux/
        lv4_config.vm.synced_folder "www", "/var/www", id: "vagrant-root", :nfs => nfs_setting
        lv4_config.vm.provision :shell, :inline => "echo \"Europe/London\" | sudo tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata"

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