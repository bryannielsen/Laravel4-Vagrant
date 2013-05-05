require 'spec_helper'

describe 'postgresql::java', :type => :class do

  describe 'on a debian based os' do
    let :facts do {
      :osfamily                 => 'Debian',
      :postgres_default_version => 'foo',
    }
    end
    it { should contain_package('postgresql-jdbc').with(
      :name   => 'libpostgresql-jdbc-java',
      :ensure => 'present'
    )}
  end

  describe 'on a redhat based os' do
    let :facts do {
      :osfamily                 => 'RedHat',
      :postgres_default_version => 'foo',
    }
    end
    it { should contain_package('postgresql-jdbc').with(
      :name   => 'postgresql-jdbc',
      :ensure => 'present'
    )}
    describe 'when parameters are supplied' do
      let :params do
        {:package_ensure => 'latest', :package_name => 'somepackage'}
      end
      it { should contain_package('postgresql-jdbc').with(
        :name   => 'somepackage',
        :ensure => 'latest'
      )}
    end
  end

  describe 'on any other os' do
    let :facts do {
      :osfamily                 => 'foo',
      :postgres_default_version => 'foo',
    }
    end

    it 'should fail' do
      expect { subject }.to raise_error(/Unsupported osfamily: foo/)
    end
  end

end
