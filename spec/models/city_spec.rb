require 'rails_helper'

describe City, type: :model do

  context "created City (let)" do
    let(:city) { City.create(:name => "test") }
    it { expect(city).to be_persisted }
    it { expect(city.name).to eq("test") }
    it { expect(City.find(city.id)).to_not be_nil }
  end

  context "created City (subject)" do
    subject { City.create(:name => "test") }
    it { is_expected.to be_persisted }
    it { expect(subject.name).to eq("test") }
    it { expect(City.find(subject.id)).to_not be_nil }
  end

end
