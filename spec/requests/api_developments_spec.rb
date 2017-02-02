require 'rails_helper'

RSpec.describe "ApiDevelopments", type: :request do

  def parsed_body
    JSON.parse(response.body)
  end

  describe "RDBMS-backend" do
    before(:each) do
      City.delete_all
      @object = City.create(:name => "Lahore")
    end
    after(:each) { City.delete_all }

    it "create RDBMS-backend model" do
      expect(City.find(@object.id).name).to eq("Lahore")
    end

    it "expose RDBMS-backend API resource" do
      expect(cities_path).to eq("/api/cities")
      get city_path(@object.id)
      expect(response).to have_http_status(:ok)
      expect(parsed_body["name"]).to eq("Lahore")
    end
  end

  describe "MongoDB-backend" do
    before(:each) do
      State.delete_all
      @object = State.create(:name => "Punjab")
    end
    after(:each) { State.delete_all }

    it "create MongoDB-backend model" do
      expect(State.find(@object.id).name).to eq("Punjab")
    end

    it "expose MongoDB-backend API resource" do
      expect(states_path).to eq("/api/states")
      get state_path(@object.id)
      expect(response).to have_http_status(:ok)
      expect(parsed_body).to include("created_at")
      expect(parsed_body).to include("id" => @object.id.to_s)
    end
  end
end
