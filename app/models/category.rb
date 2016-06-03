class Category < ActiveRecord::Base
  has_many :subjects
  has_many :resources, through: :subjects
  has_many :tags,  through: :resources
end
