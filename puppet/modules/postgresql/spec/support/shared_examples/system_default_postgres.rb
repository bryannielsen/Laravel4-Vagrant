require 'support/postgres_test_utils'
require 'support/shared_contexts/pg_vm_context'

shared_examples :system_default_postgres do
  include PostgresTestUtils
  include_context :pg_vm_context

  # this method is required by the pg_vm shared context
  def install_postgres
    sudo_and_log(vm, 'puppet apply -e "include postgresql::server"')
  end

  describe 'postgresql::initdb' do
    it "should idempotently create a working --pgdata directory so postgres can run" do
      @logger.info("starting")

      # A bare-minimum class to initdb the specified dir
      test_class = 'class {"postgresql_tests::system_default::test_initdb": }'

      # Run once to check for crashes
      sudo_and_log(vm, "puppet apply -e '#{test_class}'")

      # Run again to check for idempotence via --detailed-exitcodes
      sudo_and_log(vm, "puppet apply --detailed-exitcodes -e '#{test_class}'")

      sudo_and_log(vm, "service #{service_name} restart")

      # Connect to it and list the databases
      sudo_psql_and_log(vm, '--list --tuples-only')
    end
  end

  describe 'postgresql::db' do
    it 'should idempotently create a db that we can connect to' do

      # A bare-minimum class to add a DB to postgres, which will be running due to ubuntu
      test_class = 'class {"postgresql_tests::system_default::test_db": db => "postgresql_test_db" }'

      begin
        # Run once to check for crashes
        sudo_and_log(vm, "puppet apply --detailed-exitcodes -e '#{test_class}'; [ $? == 2 ]")

        # Run again to check for idempotence
        sudo_and_log(vm, "puppet apply --detailed-exitcodes -e '#{test_class}'")

        # Check that the database name is present
        sudo_psql_and_log(vm, 'postgresql_test_db --command="select datname from pg_database limit 1"')
      ensure
        sudo_psql_and_log(vm, '--command="drop database postgresql_test_db" postgres')
      end
    end

    it 'should take a locale parameter' do
      pending('no support for locale parameter with centos 5', :if => vm == :centos5)
      manifest = <<-EOS
        include postgresql::server
        postgresql::db { 'test1':
          user => 'test1',
          password => 'test1',
          charset => 'UTF8',
          locale => 'en_NG',
        }
      EOS
      sudo_and_log(vm, "puppet apply -e '#{manifest}'")

      # Some basic tests here to check if the db indeed was created with the
      # correct locale.
      sudo_and_log(vm, 'su postgres -c \'psql -c "show lc_ctype" test1\'')
      sudo_and_log(vm, 'su postgres -c \'psql -c "show lc_ctype" test1\' | grep en_NG')
      sudo_and_log(vm, 'su postgres -c \'psql -c "show lc_collate" test1\' | grep en_NG')
    end
  end

  describe 'postgresql::psql' do
    it 'should emit a deprecation warning' do
      test_class = 'class {"postgresql_tests::system_default::test_psql": command => "SELECT * FROM pg_datbase limit 1", unless => "SELECT 1 WHERE 1=1" }'

      data = sudo_and_log(vm, "puppet apply --detailed-exitcodes -e '#{test_class}'; [ $? == 2 ]")

      data.should match /postgresql::psql is deprecated/

    end
  end

  describe 'postgresql_psql' do
    it 'should run some SQL when the unless query returns no rows' do
      test_class = 'class {"postgresql_tests::system_default::test_ruby_psql": command => "SELECT 1", unless => "SELECT 1 WHERE 1=2" }'

      # Run once to get all packages set up
      sudo_and_log(vm, "puppet apply -e '#{test_class}'")

      # Check for exit code 2
      sudo_and_log(vm, "puppet apply --detailed-exitcodes -e '#{test_class}' ; [ $? == 2 ]")
    end

    it 'should not run SQL when the unless query returns rows' do
      test_class = 'class {"postgresql_tests::system_default::test_ruby_psql": command => "SELECT * FROM pg_datbase limit 1", unless => "SELECT 1 WHERE 1=1" }'

      # Run once to get all packages set up
      sudo_and_log(vm, "puppet apply -e '#{test_class}'")

      # Check for exit code 0
      sudo_and_log(vm, "puppet apply --detailed-exitcodes -e '#{test_class}'")
    end

  end

  describe 'postgresql::user' do
    it 'should idempotently create a user who can log in' do
      test_class = 'class {"postgresql_tests::system_default::test_user": user => "postgresql_test_user", password => "postgresql_test_password" }'

      # Run once to check for crashes
      sudo_and_log(vm, "puppet apply -e '#{test_class}'")

      # Run again to check for idempotence
      sudo_and_log(vm, "puppet apply --detailed-exitcodes -e '#{test_class}'")

      # Check that the user can log in
      sudo_psql_and_log(vm, '--command="select datname from pg_database limit 1" postgres', 'postgresql_test_user')
    end
  end

  describe 'postgresql::grant' do
    it 'should grant access so a user can create in a database' do
      test_class = 'class {"postgresql_tests::system_default::test_grant_create": db => "postgres", user => "psql_grant_tester", password => "psql_grant_pw" }'

      # Run once to check for crashes
      sudo_and_log(vm, "puppet apply -e '#{test_class}'")

      # Run again to check for idempotence
      sudo_and_log(vm, "puppet apply --detailed-exitcodes -e '#{test_class}'")

      # Check that the user can create a table in the database
      sudo_psql_and_log(vm, '--command="create table foo (foo int)" postgres', 'psql_grant_tester')

      sudo_psql_and_log(vm, '--command="drop table foo" postgres', 'psql_grant_tester')
    end
  end

  describe 'postgresql::validate_db_connections' do
    it 'should run puppet with no changes declared if database connectivity works' do
      # Setup
      setup_class = 'class {"postgresql_tests::system_default::test_db": db => "foo" }'
      sudo_and_log(vm, "puppet apply --detailed-exitcodes -e '#{setup_class}'; [ $? == 2 ]")

      # Run test
      test_pp = "postgresql::validate_db_connection {'foo': database_host => 'localhost', database_name => 'foo', database_username => 'foo', database_password => 'foo' }"
      sudo_and_log(vm, "puppet apply --detailed-exitcodes -e '#{test_pp}'")
    end

    it 'should fail catalogue if database connectivity fails' do
      # Run test
      test_pp = "postgresql::validate_db_connection {'foo': database_host => 'localhost', database_name => 'foo', database_username => 'foo', database_password => 'foo' }"
      sudo_and_log(vm, "puppet apply --detailed-exitcodes -e '#{test_pp}'; [ $? == 4 ]")
    end
  end

  describe 'postgresql::tablespace' do
    it 'should idempotently create tablespaces and databases that are using them' do
      test_class = 'class {"postgresql_tests::system_default::test_tablespace": }'

      # Run once to check for crashes
      sudo_and_log(vm, "puppet apply -e '#{test_class}'")

      # Run again to check for idempotence
      sudo_and_log(vm, "puppet apply --detailed-exitcodes -e '#{test_class}'")
        
      # Check that databases use correct tablespaces
      sudo_psql_and_expect_result(vm, '--command="select ts.spcname from pg_database db, pg_tablespace ts where db.dattablespace = ts.oid and db.datname = \'"\'tablespacedb1\'"\'"', 'tablespace1')
      sudo_psql_and_expect_result(vm, '--command="select ts.spcname from pg_database db, pg_tablespace ts where db.dattablespace = ts.oid and db.datname = \'"\'tablespacedb3\'"\'"', 'tablespace2')
    end
  end

  describe 'postgresql::pg_hba_rule' do
    it 'should create a ruleset in pg_hba.conf' do
      manifest = <<-EOS
        include postgresql::server
        postgresql::pg_hba_rule { "allow application network to access app database":
          type => "host",
          database => "app",
          user => "app",
          address => "200.1.2.0/24",
          auth_method => md5,
        }
      EOS
      sudo_and_log(vm, "puppet apply -e '#{manifest}'")
      sudo_and_log(vm, "grep '200.1.2.0/24' /etc/postgresql/*/*/pg_hba.conf || grep '200.1.2.0/24' /var/lib/pgsql/data/pg_hba.conf")
    end

    it 'should create a ruleset in pg_hba.conf that denies db access to db test1' do
      manifest = <<-EOS
        include postgresql::server
        postgresql::db { "test1":
          user => "test1",
          password => "test1",
          grant => "all",
        }
        postgresql::pg_hba_rule { "allow anyone to have access to db test1":
          type => "local",
          database => "test1",
          user => "test1",
          auth_method => reject,
          order => '001',
        }
        user { "test1":
          shell => "/bin/bash",
          managehome => true,
        }
      EOS
      sudo_and_log(vm, "puppet apply -e '#{manifest}'")
      sudo_and_log(vm, 'su - test1 -c \'psql -U test1 -c "\q" test1\'; [ $? == 2 ]')
    end
  end

  describe 'postgresql.conf include' do
    it "should support an 'include' directive at the end of postgresql.conf" do
      pending('no support for include directive with centos 5', :if => vm == :centos5)

      test_class = 'class {"postgresql_tests::system_default::test_pgconf_include": }'

      # Run once to check for crashes
      sudo_and_log(vm, "puppet apply -e '#{test_class}'")

      # Run again to check for idempotence
      sudo_and_log(vm, "puppet apply --detailed-exitcodes -e '#{test_class}'")

      sudo_and_log(vm, "service #{service_name} restart")

      # Check that the user can create a table in the database
      sudo_psql_and_expect_result(vm, '--command="show max_connections" -t', '123', 'postgres')

      cleanup_class = 'class {"postgresql_tests::system_default::test_pgconf_include_cleanup": }'
      sudo_and_log(vm, "puppet apply -e '#{cleanup_class}'")
    end
  end
end
