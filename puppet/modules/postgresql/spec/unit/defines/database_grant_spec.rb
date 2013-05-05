require 'spec_helper'

describe 'postgresql::database_grant', :type => :define do
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
      :privilege => 'ALL',
      :db => 'test',
      :role => 'test',
    }
  end
  it { should include_class("postgresql::params") }
end
