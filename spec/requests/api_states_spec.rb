require 'rails_helper'

RSpec.describe "State API", type: :request do
  include_context "db_cleanup_each"

  context "caller requests list of States" do
    it_should_behave_like "resource index", :state do
      let(:response_check) do
        expect(payload.count).to eq(resources.count)
        expect(payload.map{|c|c["name"]}).to eq(resources.map{|c|c[:name]})
      end
    end
  end

  context "a specific State exists" do
    it "returns City when using correct ID"
    it "returns not found when using incorrect ID"
  end

  context "create a new State" do
    it "can create with provided name"
  end

  context "existing State" do
    it "can update name"
    it "can be deleted"
  end
end
