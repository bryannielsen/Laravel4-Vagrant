require 'spec_helper'

describe 'postgresql::contrib', :type => :class do
  let :facts do
    {
      :postgres_default_version => '8.4',
      :osfamily => 'Debian',
    }
  end
  it { should include_class("postgresql::contrib") }
end
