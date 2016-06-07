require 'rails_helper'
RSpec.describe Category, type: :model do
  let(:rails) {Category.first}
  let(:webdev) {Cohort.first}
  let(:remote_auth) {Resource.first}
  # let (:webdev) {Cohort.create(name: "Web Development")}
  # let (:rails) { Category.create(name: "Rails", cohort: webdev)}
  # let (:google) { Resource.create(name: "Google", url: "https://www.google.com", category: rails)}
  # let (:hacker_news) { Resource.create(name: "Hacker News", url: "https://news.ycombinator.com/", category: rails)}

  describe "#cohort" do
    it 'belongs to a cohort' do
      expect(rails.cohort.name).to eq("Web Development")
    end
  end

  describe "#resources" do
    it 'has many resources' do
      expect(rails.resources).to include(remote_auth)
    end
  end
end
