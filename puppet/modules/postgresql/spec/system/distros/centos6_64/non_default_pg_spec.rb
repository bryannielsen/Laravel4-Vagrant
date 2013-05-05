require 'support/shared_examples/non_default_postgres'

describe "CentOS6, 64-bit: non-default postgres" do
  let(:vagrant_dir) { File.dirname(__FILE__) }
  let(:vm) { :centos6 }
  it_behaves_like :non_default_postgres
end
