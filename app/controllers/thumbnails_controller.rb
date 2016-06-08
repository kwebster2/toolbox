class ThumbnailsController < ApplicationController

  def create
    url = params[:url]
    t = LinkThumbnail.generate(valid_url(url))
    thumbnail = Thumbnail.find_or_create_by(
      url: t.url.to_s,
      image_url: t.images.first.src.to_s,
      description: t.description,
      title: t.title,
      favicon: t.favicon,
      resource_id: 
      )
  end
  
  # fix
  def valid_url
    
  end

end
