require 'spec_helper'

describe 'postgresql::db', :type => :define do
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
      :user => 'test',
      :password => 'test',
    }
  end
  it { should include_class("postgresql::params") }
end
