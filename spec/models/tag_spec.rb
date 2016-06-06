require 'rails_helper'

RSpec.describe Tag, type: :model do
  let (:web_development) {Tag.create(name: "Web Development")}
  let (:hacker_news) { Resource.create(name: "Hacker News", url: "https://news.ycombinator.com/", tags: [web_development])}

  it 'has many resources through resources tags' do
    expect(web_development.resources).to eq([hacker_news])
  end
end
