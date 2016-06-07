describe "sign in with Github" do

  it 'can sign in a user with Github account' do
    visit '/'
    click_link 'Sign In'
    expect(page).to have_content("Select your cohort")
  end

end
