require 'rails_helper'

RSpec.describe Resource, type: :model do
  let (:kevin) {User.create(user_name: "kwebster2")}
  let (:web_development) {Tag.create(name: "Web Development")}
  let (:rails) { Category.create(name: "Rails")}
  let (:google) { Resource.create(name: "Google", url: "https://www.google.com", category: rails, user: kevin, tags: [web_development])}

  it 'belongs to a user' do
    expect(google.user.user_name).to eq("kwebster2")
  end

  it 'belongs to a category' do
    expect(google.category.name).to eq("Rails")
  end

  it 'has many tags through resources tags' do
    expect(google.tags).to eq([web_development])
  end

end
