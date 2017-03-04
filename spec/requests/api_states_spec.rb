require 'rails_helper'

RSpec.describe "State API", type: :request do
  include_context "db_cleanup_each"
  let(:user) { login signup(FactoryGirl.attributes_for(:user)) }

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
        expect(payload["name"]).to eq(resource_state[:name])

        id=payload["id"]
        expect(State.find(id).name).to eq(resource_state[:name])
      end
    end
  end

  context "existing State" do
    it_should_behave_like "modifiable resource", :state do
      let(:update_check) do
        expect(resource["name"]).to_not eq(new_state[:name])
        expect(State.find(resource["id"]).name).to eq(new_state[:name])
      end
    end
  end
end
