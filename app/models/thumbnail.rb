class Thumbnail < ActiveRecord::Base
  belongs_to :resource

  def self.parse(url)
    u = valid_url(url)
  end

  private
  def self.valid_url(url)
    x = url.split("/")
    if x.first.include?("http")
      if x[1].include?("www.")
        return url 
      else
        x[1] = "www."
      end
    else
      x.unshift("http://")
      return x.join
    end
  end
end
