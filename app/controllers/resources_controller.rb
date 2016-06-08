class ResourcesController < ApplicationController

  def new
    @resource = Resource.new(subject_id: params["subject_id"])
  end

  def edit
    @resource = Resource.find(params[:id])
  end

  def update
    resource = Resource.find(params[:id])
    if resource.update(resource_params)
      resource.save
      redirect_to cohort_path(resource.category.cohort.slug)
    else
      redirect_to user_path(current_user)
    end
  end

  def create
    # Create resource and associate user
    @resource = Resource.create(resource_params)
    @resource.user = current_user
    
    # Create tags and associate to resource
    tags = parse_tags(params["resource"]["tags"])
    tags.each do |tag|
      t = Tag.find_or_create_by(name: tag)
      @resource.tags << t
    end

    # Create thumbnail and associate to resource
    begin
      @thumb_data = LinkThumbnailer.generate(Thumbnail.parse(@resource.url))
      thumbnail = Thumbnail.find_or_create_by(url: @thumb_data.url.to_s)
      thumbnail.update(image_url: @thumb_data.images.first.src.to_s, description: @thumb_data.description, title: @thumb_data.title, favicon: @thumb_data.favicon, resource_id: @resource.id)
      thumbnail.save
      @resource.thumbnail = thumbnail
    rescue LinkThumbnailer::Exceptions => e
      @resource.thumbnail = nil
    end
    
    # Save resource and redirect
    @resource.save
    refer = request.env["HTTP_REFERER"].split("/")
    if refer.length > 5
      redirect_to cohort_category_path(refer[refer.length-3], refer.last)
    else
      redirect_to cohort_path(@resource.category.cohort.slug)
    end
  end

  def bookmark
    @resource = Resource.find(params[:id])
    @resource.add_bookmark(current_user)
    @current_user = current_user
    respond_to do |format|
      format.js
    end
  end

  def destroy
    resource = Resource.find(params[:id])
    user = resource.user
    resource.destroy
    redirect_to user_path(user.user_name)
  end

  private
  def resource_params
    params.require(:resource).permit(:name, :description, :url, :category_id)
  end

  def parse_tags(hash_string)
    hash_string.values.first.split(",").map do |x|
      x.chomp.strip
    end
  end
end
