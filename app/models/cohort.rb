class Cohort < ActiveRecord::Base
  has_many :users
  has_many :categories
  include Slugify

end
