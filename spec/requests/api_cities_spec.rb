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
end
