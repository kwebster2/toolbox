class Cohort < ActiveRecord::Base
  has_many :users
  has_many :categories
  has_many :resources, through: :categories

  include Slugify

  before_create :to_slug
end
