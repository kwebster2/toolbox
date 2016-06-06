class Resource < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject
  has_many   :resources_tags
  has_many   :tags, through: :resources_tags

  def short_description
    if description.nil?
      return
    elsif description.length > 100
      return description[0..99]+"..."  
    else
      return description
    end
  end
end
