require 'support/shared_examples/system_default_postgres'

describe "CentOS 5, 64-bit: default system postgres" do
  let(:vagrant_dir) { File.dirname(__FILE__) }
  let(:vm) { :centos5 }
  let(:service_name) { 'postgresql' }
  it_behaves_like :system_default_postgres
end
