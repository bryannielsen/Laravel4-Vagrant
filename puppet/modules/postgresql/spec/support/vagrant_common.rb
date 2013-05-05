def apply_common_vagrant_config(config)
  # Resolve DNS via NAT
  config.vm.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]

  # Share the various required modules
  # TODO: it would be better to install this via the puppet module tool
  config.vm.share_folder "puppetlabs-stdlib-module", "/usr/share/puppet/modules/stdlib", "../../../../../puppetlabs-stdlib"
  config.vm.share_folder "puppetlabs-apt-module", "/usr/share/puppet/modules/apt", "../../../../../puppetlabs-apt"
  config.vm.share_folder "ripienaar-concat-module", "/usr/share/puppet/modules/concat", "../../../../../puppet-concat"

  # Share the postgressql module
  config.vm.share_folder "puppet-postgresql-module", "/usr/share/puppet/modules/postgresql", "../../../.."

  # Share the module of test classes
  config.vm.share_folder "puppet-postgresql-tests", "/usr/share/puppet/modules/postgresql_tests", "../../test_module"

  # Provision with a base puppet config just so we don't have to repeat the puppet user/group
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "../../"
    puppet.manifest_file  = "base.pp"
  end
end
