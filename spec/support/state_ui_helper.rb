module StateUiHelper
  STATE_FORM_XPATH="//h3[text()='States']/../form"
  STATE_LIST_XPATH="//h3[text()='States']/../ul"

  def create_state state_attr
    visit "#{root_path}/#/" unless page.has_css?("h3", text:"States")
    expect(page).to have_css("h3", text:"States")
    within(:xpath, STATE_FORM_XPATH) do
      fill_in("name", with: state_attr[:name])
      expect(page).to have_field("name", :with=>foo_state[:name])
      click_button("Create Foo", :disabled=>false)
    end
    within(:xpath, STATE_LIST_XPATH) do
      expect(page).to have_css("li a", :text => state_attr[:name])
    end
  end

  def update_state existing_name, new_name
    visit "#{root_path}/#/" unless page.has_css?("h3", text:"States")
    expect(page).to have_css("h3", text:"States") #on the Foos page
    
    within(:xpath, STATE_LIST_XPATH) do
      find("li a", :text => existing_name).click
    end
    within(:xpath, STATE_FORM_XPATH) do
      find_field("name", :readonly=>false, :wait=>5)
      fill_in("name", :with => new_name)
      click_button("Update State")
    end
    within(:xpath, STATE_LIST_XPATH) do
      expect(page).to have_css("li a", :text => new_name)
    end
  end

  def delete_state name
    visit "#{root_path}/#/" unless page.has_css?("h3", text:"State")
    
    within(:xpath, STATE_LIST_XPATH) do
      find("li a", :text => name).click
    end
    within(:xpath, STATE_FORM_XPATH) do
      find(:xpath, "//button[contains(@ng-click, 'remove()')]").click
    end
    # within(:xpath, STATE_FORM_XPATH) do
    #   click_button("Remove State")
    # end
    within(:xpath, STATE_LIST_XPATH) do
      expect(page).to have_no_css("li a", :text => name)
    end
  end
end
