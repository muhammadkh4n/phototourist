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

  context "created City (lazy)" do
    let(:before_count) { City.count }
    let(:city)         { City.create(:name => "test") }
    it { expect(city).to be_persisted }
    it { expect(city.name).to eq("test") }
    it { expect(City.find(city.id)).to_not be_nil }
    xit { expect(City.count).to eq(before_count + 1) }
    pending { expect(City.count).to eq(before_count + 1) }
  end

end
