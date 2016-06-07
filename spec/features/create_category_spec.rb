feature 'Capybara: Resources', :js => true do
  before :each do
    visit '/'
    click_link('Sign In')
    click_link('Web')
  end

  scenario 'can create new resource' do
    click_button('+Post Resource')
    within("div.modal-content") do
      fill_in('resource_name', :with => 'Google')
      fill_in('resource_url', :with => 'https://www.google.com')
      select('Rails', :from => 'resource_category_id')
      click_button('Save Resource')
    end
    wait_for_ajax
    expect(Resource.last.name).to eq("Google")
  end
end
