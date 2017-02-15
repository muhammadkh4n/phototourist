require 'rails_helper'

describe "City API", type: :request do
  include_context "db_cleanup_each", :transaction

  describe "GET /api/cities" do
    it "works! (now write some real specs)" do
      get cities_path
      expect(response).to have_http_status(:ok)
    end
  end
end
