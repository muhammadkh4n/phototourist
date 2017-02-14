require 'rails_helper'

describe City, type: :model do

  before(:all) do
    DatabaseCleaner[:active_record].strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end
  after(:all) do
    DatabaseCleaner.clean_with(:truncation)
  end
  before(:each) do
    DatabaseCleaner.start
  end
  after(:each) do
    DatabaseCleaner.clean
  end

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

  context "created City (lazy/eager)" do
    let!(:before_count) { City.count }
    let(:city)         { City.create(:name => "test") }
    it { expect(city).to be_persisted }
    it { expect(city.name).to eq("test") }
    it { expect(City.find(city.id)).to_not be_nil }
    it { city; expect(City.count).to eq(before_count + 1) }
  end

end
