require 'rails_helper'

RSpec.describe Cohort, type: :model do
  let (:webdev) {Cohort.first}
  let (:kevin) {User.create(user_name: "kwebster2", cohort: webdev)}
  let (:charlie) {User.create(user_name: "cjtafoya", cohort: webdev)}
  let (:rails) {Category.first}
  let (:javascript) {Category.second}

  it 'has many users' do
    expect(webdev.users).to include(kevin, charlie)
  end

  it 'has many categories' do
    expect(webdev.categories).to include(rails, javascript)
  end

end
