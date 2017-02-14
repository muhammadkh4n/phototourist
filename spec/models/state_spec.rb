require 'rails_helper'

require "mongo"
Mongo::Logger.logger.level = ::Logger::DEBUG

describe State, type: :model do
  before(:all) do
    State.delete_all
  end

  context "created State (let)" do
    let(:state) { State.create(:name => "test") }
    after(:each) do
      state.delete
    end

    it { expect(state).to be_persisted }
    it { expect(state.name).to eq("test") }
    it { expect(State.find(state.id)).to_not be_nil }
  end

end
