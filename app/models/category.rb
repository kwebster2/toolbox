class Category < ActiveRecord::Base
  belongs_to :cohort
  has_many :subjects
  has_many :resources
  has_many :tags,  through: :resources
  validates :name, uniqueness: true, presence: true

  include Slugify
  before_create :to_slug

  def self.default_categories
    # Web Development
    Category.find_or_create_by(name: "Rails", cohort_id: 1)
    Category.find_or_create_by(name: "JavaScript", cohort_id: 1)
    Category.find_or_create_by(name: "jQuery", cohort_id: 1)
    Category.find_or_create_by(name: "Ruby", cohort_id: 1)    
    Category.find_or_create_by(name: "SQL", cohort_id: 1)
    Category.find_or_create_by(name: "Ember", cohort_id: 1)
    Category.find_or_create_by(name: "AngularJS", cohort_id: 1)
    Category.find_or_create_by(name: "Sinatra", cohort_id: 1)
    Category.find_or_create_by(name: "Rack", cohort_id: 1)
    Category.find_or_create_by(name: "CompSci", cohort_id: 1)
    Category.find_or_create_by(name: "Blogs", cohort_id: 1)
    Category.find_or_create_by(name: "Lols", cohort_id: 1)    
    # iOS
  end

end
