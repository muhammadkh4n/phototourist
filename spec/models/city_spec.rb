require 'rails_helper'

describe City, type: :model do

  context "created City" do
    before(:each) do
      @city=City.create(:name => "test")
    end
    it "will be persisited, have a name, and be found" do
      expect(@city).to be_persisted
      expect(@city.name).to eq("test")
      expect(City.find(@city.id)).to_not be_nil
    end
  end

end
