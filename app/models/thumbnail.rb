class Thumbnail < ActiveRecord::Base
  belongs_to :resource

  def self.parse(resource_url)
    u = valid_url(resource_url)
    return u
  end

  private
  def self.valid_url(resource_url)
    uri = URI(resource_url)
    if uri.scheme.nil? && uri.host.nil?
      url = 'http://'+ uri.path
    elsif uri.scheme == 'https://'
      url = 'http://'+ uri.path
    else
      url = uri.to_s
    end
    return url
  end
end
