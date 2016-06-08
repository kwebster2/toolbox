class Tag < ActiveRecord::Base
  has_many :resources_tags
  has_many :resources, through: :resources_tags

  def self.search(term)
    where("name ILIKE ?", "%#{term}%")
  end


  def default_tags
    # Need to fill out
  end
end
