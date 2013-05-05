require 'spec_helper'

describe 'postgresql::pg_hba', :type => :define do
  let :facts do
    {
      :postgres_default_version => '8.4',
      :osfamily => 'Debian',
      :concat_basedir => tmpfilename('pg_hba'),
    }
  end
  let :title do
    'test'
  end
  let :params do
    {
      :target => tmpfilename('pg_hba_target'),
    }
  end
  it { should include_class("postgresql::params") }
end
