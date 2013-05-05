require 'spec_helper'

describe 'postgresql::validate_db_connection', :type => :define do
  let :facts do
    {
      :postgres_default_version => '8.4',
      :osfamily => 'Debian',
    }
  end
  let :title do
    'test'
  end
  let :params do
    {
      :database_host => 'test',
      :database_name => 'test',
      :database_password => 'test',
      :database_username => 'test',
    }
  end
  it { should include_class("postgresql::params") }
end
