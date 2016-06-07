describe 'create new category' do
  let! (:webdev) {Cohort.create(name: "Web Development")}

  it 'can create new category' do
    visit '/cohorts/web-development'
    click_button '+Add Category'
  end
end
