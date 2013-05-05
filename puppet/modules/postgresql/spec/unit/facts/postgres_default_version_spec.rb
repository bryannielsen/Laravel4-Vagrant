require 'spec_helper'

describe 'postgres_default_version', :type => :fact do
  it 'should handle redhat 6.0' do
    Facter.fact(:osfamily).stubs(:value).returns 'RedHat'
    Facter.fact(:operatingsystemrelease).stubs(:value).returns '6.0'
    Facter.fact(:postgres_default_version).value.should == '8.4'
  end

  it 'should return unknown if osfamily is unknown' do
    Facter.fact(:osfamily).expects(:value).returns 'test'
    Facter.fact(:postgres_default_version).value.should eq 'unknown'
  end
end
