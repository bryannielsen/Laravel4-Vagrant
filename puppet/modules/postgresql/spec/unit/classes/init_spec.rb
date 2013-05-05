require 'spec_helper'

describe 'postgresql', :type => :class do
  let :facts do
    {
      :postgres_default_version => '8.4',
      :osfamily => 'Debian',
    }
  end
  it { should include_class("postgresql") }

  context 'support override params' do
    let(:params) {{
      :version => '8.4',
      :manage_package_repo => true,
      :package_source => '',
      :locale => 'en_NG',
      :charset => 'UTF8',
      :datadir => '/srv/pgdata',
      :confdir => '/opt/pg/etc',
      :bindir => '/opt/pg/bin',
      :client_package_name => 'my-postgresql-client',
      :server_package_name => 'my-postgresql-server',
      :contrib_package_name => 'my-postgresql-contrib',
      :devel_package_name => 'my-postgresql-devel',
      :java_package_name => 'my-postgresql-java',
      :service_name => 'my-postgresql',
      :user => 'my-postgresql',
      :group => 'my-postgresql',
      :run_initdb => true,
    }}

    it { should include_class("postgresql") }
    it { should include_class("postgresql::params") }
  end
end
