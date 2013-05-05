require 'support/postgres_test_utils'
require 'support/shared_contexts/pg_vm_context'

shared_examples :non_default_postgres do
  include PostgresTestUtils
  include_context :pg_vm_context

  # this method is required by the pg_vm shared context
  def install_postgres; end

  describe 'postgresql global config' do
    it 'with version and manage_package_repo set, we should be able to idempotently create a db that we can connect to' do
      manifest = <<-EOS
        # Configure version and manage_package_repo globally, install postgres
        # and then try to install a new database.
        class { "postgresql":
          version               => "9.2",
          manage_package_repo   => true,
          package_source        => "yum.postgresql.org",
        }->
        class { "postgresql::server": }->
        postgresql::db { "postgresql_test_db":
          user        => "foo1",
          password    => "foo1",
        }
      EOS

      begin
        # Run once to check for crashes
        sudo_and_log(vm, "puppet apply --detailed-exitcodes -e '#{manifest}'; [ $? = 2 ]")

        # Run again to check for idempotence
        sudo_and_log(vm, "puppet apply --detailed-exitcodes -e '#{manifest}'")

        # Check that the database name is present
        sudo_psql_and_log(vm, 'postgresql_test_db --command="select datname from pg_database limit 1"')
      ensure
        sudo_psql_and_log(vm, '--command="drop database postgresql_test_db" postgres')
      end
    end

    it 'with locale and charset, the postgres database should reflect that locale' do
      pending('no support for initdb with lucid', :if => vm == :lucid)
      pending('no support for locale parameter with centos 5', :if => vm == :centos5)

      manifest = <<-EOS
        # Set global locale and charset option, and try installing postgres
        class { 'postgresql':
          locale  => 'en_NG',
          charset => 'UTF8',
        }->
        class { 'postgresql::server': }
      EOS

      # Run once to check for crashes
      sudo_and_log(vm, "puppet apply --detailed-exitcodes -e '#{manifest}'; [ $? = 2 ]")
      # Run again to check for idempotence
      sudo_and_log(vm, "puppet apply --detailed-exitcodes -e '#{manifest}'")

      # Use the command line to create the database, instead of the puppet way
      # to bypass any puppet effects and make sure the default works _always_.
      sudo_and_log(vm, "su postgres -c 'createdb test1'")

      # Check locale of database 'postgres' to ensure initdb did the correct
      # thing.
      sudo_and_log(vm, 'su postgres -c \'psql -c "show lc_ctype" test1\'')
      sudo_and_log(vm, 'su postgres -c \'psql -c "show lc_ctype" test1\' | grep en_NG')
      sudo_and_log(vm, 'su postgres -c \'psql -c "show lc_collate" test1\' | grep en_NG')
    end
  end
end
