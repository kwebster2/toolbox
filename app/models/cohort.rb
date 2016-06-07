class Cohort < ActiveRecord::Base
  has_many :users
  has_many :categories
  has_many :resources, through: :categories
  has_many :tags, through: :resources

  include Slugify

  before_create :to_slug

  def self.default_cohorts
    Cohort.find_or_create_by(name: "Web Development")
    Cohort.find_or_create_by(name: "iOS")
  end
end
