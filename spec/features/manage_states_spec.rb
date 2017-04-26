require 'rails_helper'
require 'support/state_ui_helper.rb'

RSpec.feature "ManageStates", type: :feature, :js => true do
  include_context "db_cleanup_each"
  include StateUiHelper
  STATE_FORM_XPATH=StateUiHelper::STATE_FORM_XPATH
  STATE_LIST_XPATH=StateUiHelper::STATE_LIST_XPATH

  feature "view existing States" do
    let(:states) { (1..5).map { FactoryGirl.create(:state) }.sort_by {|v| v["name"]} }

    scenario "when no instances exist" do
      visit  "#{root_path}/#/states"
      within(:xpath, STATE_LIST_XPATH) do
        expect(page).to have_no_css("li")
        expect(page).to have_css("li", count:0)
        expect(all("ul li").size).to eq(0)
      end
    end
    scenario "when instances exist" do
      visit "#{root_path}/#/states" if states
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
    let(:state_attr) { FactoryGirl.attributes_for(:state) }
    background(:each) do
      visit "#{root_path}/#/states"
      expect(page).to have_css("h3", text:"States")
      within(:xpath, STATE_FORM_XPATH) do
        expect(page).to have_css("li", count:0)
      end
    end
    scenario "has input form" do
      expect(page).to have_css("label", text:"Name")
      expect(page).to have_css("input[name='name'][ng-model*='state.name']")
      expect(page).to have_css("button[ng-click*='create()']", text:"Create State")
      expect(page).to have_button("Create State")
    end
    scenario "complete form" do
      within(:xpath, STATE_FORM_XPATH) do
        fill_in("name", with: state_attr[:name])
        click_button("Create State")
      end
      within(:xpath, STATE_LIST_XPATH) do
        expect(page).to have_css("li", count: 1)
        expect(page).to have_content(state_attr[:name])
      end
    end

    scenario "complete form with helper" do
      create_state state_attr

      within(:xpath, STATE_LIST_XPATH) do
        expect(page).to have_css("li", count: 1)
      end
    end

    scenario "complete form with XPath" do
      # find(:xpath, "//input[@ng-model='statesVM.state.name']").set(state_attr[:name])
      find(:xpath, "//input[contains(@ng-model, 'state.name')]").set(state_attr[:name])
      # find(:xpath, "//button[@ng-click='statesVM.create()']").click
      find(:xpath, "//button[contains(@ng-click, 'create()')]").click
      within(:xpath, STATE_LIST_XPATH) do
        using_wait_time 10 do
          expect(page).to have_xpath(".//li", count: 1)
          # expect(page).to have_xpath("//*[text()='#{state_attr[:name]}']")
          expect(page).to have_content(state_attr[:name])
        end
      end
    end
  end

  feature "with existing State" do
    let(:state_attr) { FactoryGirl.attributes_for(:state) }

    background(:each) do
      create_state(state_attr)
    end

    scenario "can be updated" do
      existing_name=state_attr[:name]
      new_name=FactoryGirl.attributes_for(:state)[:name]

      within(:xpath, STATE_LIST_XPATH) do
        expect(page).to have_css("li", count: 1)
        expect(page).to have_css("li", :text=>existing_name)
        expect(page).to have_no_css("li", :text=>new_name)
      end

      update_state(existing_name, new_name)

      within(:xpath, STATE_LIST_XPATH) do
        expect(page).to have_css("li", :count=>1)
        expect(page).to have_no_css("li", :text=>existing_name)
        expect(page).to have_css("li", :text=>new_name)
      end
    end

    scenario "can be deleted" do
      within(:xpath, STATE_LIST_XPATH) do
        expect(page).to have_css("a",text: state_attr[:name])
      end

      delete_state(state_attr[:name])

      within(:xpath, STATE_LIST_XPATH) do
        expect(page).to have_no_css("li a", :text => state_attr[:name])
      end
    end
  end
end
