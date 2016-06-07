require 'rails_helper'

RSpec.describe Bookmark, type: :model do

  let(:bookmark) {Bookmark.first}
  let(:user) {User.first}
  let(:resource) {Resource.first}

  it 'belongs to a user' do
    expect(bookmark.user).to eq(user)
  end

  it 'belongs to a resource' do
    expect(bookmark.resource).to eq(resource)
  end

end
