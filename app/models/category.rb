class Category < ActiveRecord::Base
  belongs_to :cohort
  has_many :subjects
  has_many :resources, through: :subjects
  has_many :tags,  through: :resources
  include Slugify


end
