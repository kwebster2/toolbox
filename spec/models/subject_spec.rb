require 'rails_helper'

RSpec.describe Subject, type: :model do
  let (:rails) { Category.create(name: "Rails")}
  let (:web_development) {Tag.create(name: "Web Development")}
  let (:authentication) { Subject.create(name: "Authentication", category: rails)}

  it 'belongs to a category' do
    expect(authentication.category.name).to eq("Rails")
  end

  context 'resources' do
    let!(:hacker_news) { Resource.create(name: "Hacker News", url: "https://news.ycombinator.com/", subject: authentication, tags: [web_development])}

    it 'has many resources' do
      expect(authentication.resources.first.name).to eq("Hacker News")
    end

    it 'has many tags through resources' do
      expect(authentication.tags).to eq([web_development])
    end

  end
end
