require 'support/shared_examples/system_default_postgres'

describe "Ubuntu Lucid, 64-bit: default system postgres" do
  let(:vagrant_dir) { File.dirname(__FILE__) }
  let(:vm) { :lucid }
  let(:service_name) { 'postgresql-8.4' }
  it_behaves_like :system_default_postgres
end
