require 'rails_helper'

RSpec.describe Cohort, type: :model do
  let (:webdev) {Cohort.create(name: "Web Development")}
  let (:kevin) {User.create(user_name: "kwebster2", cohort: webdev)}
  let (:charlie) {User.create(user_name: "cjtafoya", cohort: webdev)}
  let (:rails) { Category.create(name: "Rails", cohort: webdev)}
  let (:javascript) { Category.create(name: "JavaScript", cohort: webdev)}

  it 'has many users' do
    expect(webdev.users).to eq([kevin, charlie])
  end

  it 'has many categories' do
    expect(webdev.categories).to eq([rails, javascript])
  end

end
