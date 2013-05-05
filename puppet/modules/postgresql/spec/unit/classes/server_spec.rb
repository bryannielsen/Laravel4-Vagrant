require 'spec_helper'

describe 'postgresql::server', :type => :class do
  let :facts do
    {
      :postgres_default_version => '8.4',
      :osfamily => 'Debian',
      :concat_basedir => tmpfilename('server'),
    }
  end
  it { should include_class("postgresql::server") }
end
