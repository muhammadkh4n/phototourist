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
    it_should_behave_like "show resource", :state do
      let(:response_check) do
        expect(payload).to have_key("id")
        expect(payload).to have_key("name")
        expect(payload["id"]).to eq(resource.id.to_s)
        expect(payload["name"]).to eq(resource.name)
      end
    end
  end

  context "create a new State" do
    it_should_behave_like "create resource", :state do
      let(:response_check) do
        expect(payload).to have_key("id")
        expect(payload).to have_key("name")
        expect(payload["name"]).to eq(resource_attr[:name])

        id=payload["id"]
        expect(State.find(id).name).to eq(resource_attr[:name])
        pp payload
      end
    end
  end

  context "existing State" do
    it_should_behave_like "existing resource", :state do
      let(:check_update) do
        expect(State.find(resource.id).name).to eq(new_name)
      end
    end
  end
end
