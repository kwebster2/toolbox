require 'rails_helper'

RSpec.describe User, type: :model do
  let (:webdev) {Cohort.create(name: "Web Development")}
  let (:kevin) {User.create(user_name: "kwebster2", cohort: webdev)}
  let (:google) { Resource.create(name: "Google", url: "https://www.google.com", user: kevin)}

  it 'has many resources' do
    expect(kevin.resources).to eq([google])
  end

  it 'belongs to a cohort' do
    expect(kevin.cohort.name).to eq("Web Development")
  end
end
