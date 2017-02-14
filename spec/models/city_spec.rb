require 'rails_helper'

describe City, type: :model do

  context "valid City" do
    it "has a name" do
      city = City.create(:name => "test")
      expect(city).to be_valid
      expect(city.name).to_not be_nil
    end
  end

end
