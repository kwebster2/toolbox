class Tag < ActiveRecord::Base
  has_many :resources_tags
  has_many :resources, through: :resources_tags

  def self.search(term, cohort_id)
    where("name ILIKE ? AND cohort_id = ?", "%#{term}%", cohort_id)
  end


  def default_tags
    # Need to fill out
  end
end
