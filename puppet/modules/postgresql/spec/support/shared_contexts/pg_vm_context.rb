require 'logger'
require 'vagrant'
require 'support/postgres_test_config'


if PostgresTestConfig::HardCoreTesting
  # this will just make sure that we throw an error if the user tries to
  # run w/o having Sahara installed
  require 'sahara'
end

shared_context :pg_vm_context do
  before(:all) do
    @logger = Logger.new(STDOUT)
    @logger.level = Logger::DEBUG # TODO: get from environment or rspec?

    @env = Vagrant::Environment::new(:cwd => vagrant_dir)

    if PostgresTestConfig::HardCoreTesting
      @env.cli("destroy", vm.to_s, "--force") # Takes too long
    end

    @env.cli("up", vm.to_s)

    if PostgresTestConfig::HardCoreTesting
      sudo_and_log(vm, 'if [ "$(facter osfamily)" == "Debian" ] ; then apt-get update ; fi')
    end

    install_postgres

    #sudo_and_log(vm, 'puppet apply -e "include postgresql::server"')

    if PostgresTestConfig::HardCoreTesting
      # Sahara ignores :cwd so we have to chdir for now, see https://github.com/jedi4ever/sahara/issues/9
      Dir.chdir(vagrant_dir)
      @env.cli("sandbox", "on", vm.to_s)
    end
  end

  after(:all) do
    if PostgresTestConfig::SuspendVMsAfterSuite
      @logger.debug("Suspending VM")
      @env.cli("suspend", vm.to_s)
    end
  end


  after(:each) do
    if PostgresTestConfig::HardCoreTesting
      @env.cli("sandbox", "rollback", vm.to_s)
    end
  end

end
