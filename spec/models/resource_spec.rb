require 'rails_helper'

RSpec.describe Resource, type: :model do
  let (:kevin) {User.create(user_name: "kwebster2")}
  let (:authentication) { Subject.create(name: "Authentication")}
  let (:rails) {Tag.create(name: "Rails")}
  let (:web_development) {Tag.create(name: "Web Development")}
  let (:google) { Resource.create(name: "Google", url: "https://www.google.com", subject: authentication, user: kevin, tags: [web_development, rails])}

  it 'belongs to a user' do
    expect(google.user.user_name).to eq("kwebster2")
  end

  it 'belongs to a subject' do
    expect(google.subject.name).to eq("Authentication")
  end

  it 'has many tags through resources tags' do
    expect(google.tags).to eq([web_development, rails])
  end

end
