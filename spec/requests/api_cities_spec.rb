require 'rails_helper'

describe "City API", type: :request do
  include_context "db_cleanup_each", :transaction

  context "caller requests list of Foos" do
    let!(:cities) { (1..5).map {|i| FactoryGirl.create(:city) } }

    it "return all instances" do
      get cities_path, {:s=>"search"}, {"Accept"=>"application/json"}
      expect(request.method).to eq("GET")
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq("application/json")
      expect(response["X-Frame-Options"]).to eq("SAMEORIGIN")

      payload=parsed_body
      expect(payload.count).to eq(cities.count)
      expect(payload.map{|c|c["name"]}).to eq(cities.map{|c|c[:name]})
    end
  end

  context "a specific City exists" do
    let(:city) { FactoryGirl.create(:city) }
    let(:bad_id) { 123453421 }

    it "returns City when using correct ID" do
      get city_path(city.id)
      expect(response).to have_http_status(:ok)
      #pp parsed_body

      payload=parsed_body
      expect(payload).to have_key("id")
      expect(payload).to have_key("name")
      expect(payload["id"]).to eq(city.id)
      expect(payload["name"]).to eq(city.name)
    end

    it "returns not found when using incorrect ID" do
      get city_path(bad_id)
      expect(response).to have_http_status(:not_found)
      expect(response.content_type).to eq("application/json")

      payload=parsed_body
      expect(payload).to have_key("errors")
      expect(payload["errors"]).to have_key("full_messages")
      expect(payload["errors"]["full_messages"][0]).to include("cannot", "#{bad_id}")
    end
  end

  context "create a new City" do
    let(:city_state) { FactoryGirl.attributes_for(:city) }

    it "can create with provided name" do
      jpost cities_path, city_state
      expect(response).to have_http_status(:created)
      expect(response.content_type).to eq("application/json")

      payload=parsed_body
      expect(payload).to have_key("id")
      expect(payload).to have_key("name")
      expect(payload["name"]).to eq(city_state[:name])
      id=payload["id"]

      expect(City.find(id).name).to eq(city_state[:name])
    end
  end

  context "existing City" do
    it "can update name"
    it "can be deleted"
  end
end
