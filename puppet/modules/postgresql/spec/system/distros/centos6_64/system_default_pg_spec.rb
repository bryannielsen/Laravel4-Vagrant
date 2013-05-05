require 'support/shared_examples/system_default_postgres'

describe "CentOS6, 64-bit: default system postgres" do
  let(:vagrant_dir) { File.dirname(__FILE__) }
  let(:vm) { :centos6 }
  let(:service_name) { 'postgresql' }
  it_behaves_like :system_default_postgres
end
