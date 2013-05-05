require 'support/shared_examples/non_default_postgres'

describe "Ubuntu Lucid, 64-bit: non-default postgres" do
  let(:vagrant_dir) { File.dirname(__FILE__) }
  let(:vm) { :lucid }
  it_behaves_like :non_default_postgres
end
