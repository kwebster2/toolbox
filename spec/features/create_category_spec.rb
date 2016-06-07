feature 'Capybara: Create Resource', :js => true do
  before :each do
    visit '/'
    click_link 'Sign In'
  end

  scenario 'can create new resource' do
    visit '/cohorts/web-development'
    click_button('+Post Resource')
    fill_in('resource_name', :with => 'Google')
    fill_in('resource_url', :with => 'https://www.google.com')
    select('Rails', :from => 'resource_category_id')
    click_button('Save Resource')
    expect(page).to have_content("Google")
  end
end
