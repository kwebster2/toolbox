module Slugify
  def to_slug
    name.downcase.gsub(" ", "-")
  end
end
