require 'rails_helper'

describe City, type: :model do

  context "created City" do
    let(:city) { City.create(:name => "test") }
    it "will be persisited" do
      expect(city).to be_persisted
    end

    it "will have a name" do
      expect(city.name).to eq("test")
    end

    it "will be found" do
      expect(City.find(city.id)).to_not be_nil
    end
  end

end
