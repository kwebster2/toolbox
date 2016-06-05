require 'rails_helper'

RSpec.describe Category, type: :model do
  let (:webdev) {Cohort.create(name: "Web Development")}
  let (:rails) { Category.create(name: "Rails", cohort: webdev)}
  let (:authentication) { Subject.create(name: "Authentication", category: rails)}
  let (:routes) { Subject.create(name: "Routes", category: rails)}
  let (:google) { Resource.create(name: "Google", url: "https://www.google.com", subject: authentication)}
  let (:hacker_news) { Resource.create(name: "Hacker News", url: "https://news.ycombinator.com/", subject: routes)}


  it 'has a name' do
    expect(rails.name).to eq("Rails")
  end

  it 'belongs to a cohort' do
    expect(rails.cohort.name).to eq("Web Development")
  end

  it 'has many subjects' do
    expect(rails.subjects).to eq([authentication, routes])
  end

  it 'has many resources through subjects' do
    expect(rails.resources).to eq([google, hacker_news])
  end

end
