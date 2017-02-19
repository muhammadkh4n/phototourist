require 'rails_helper'

RSpec.feature "ManageStates", type: :feature, :js => true do
  include_context "db_cleanup_each"
  STATE_FORM_XPATH="//h3[text()='States']/../form"
  STATE_LIST_XPATH="//h3[text()='States']/../ul"

  feature "view existing States" do
    let(:states) { (1..5).map { FactoryGirl.create(:state) }.sort_by {|v| v["name"]} }
    
    scenario "when no instances exist" do
      visit root_path
      within(:xpath, STATE_LIST_XPATH) do
        expect(page).to have_no_css("li")
        expect(page).to have_css("li", count:0)
        expect(all("ul li").size).to eq(0)
      end
    end
    scenario "when instances exist" do
      visit root_path if states
      within(:xpath, STATE_LIST_XPATH) do
        expect(page).to have_css("li:nth-child(#{states.count})")
        expect(page).to have_css("li", count:states.count)
        expect(all("ul li").size).to eq(states.count)
        states.each_with_index do |state, i|
          expect(page).to have_css("li:nth-child(#{i+1})", :text => state.name)
        end
      end
    end
  end

  feature "add new State" do
    scenario "has input form"
    scenario "complete form"
  end

  feature "with existing State" do
    scenario "can be updated"
    scenario "can be deleted"
  end
end
