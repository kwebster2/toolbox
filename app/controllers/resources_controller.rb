class ResourcesController < ApplicationController

  def new
    @resource = Resource.new(subject_id: params["subject_id"])
  end

  def edit
    @resource = Resource.find(params[:id])
  end

  def create
    @resource = Resource.create(resource_params)
    @resource.user = current_user
    tags = parse_tags(params["resource"]["tags"])
    tags.each do |tag|
      t = Tag.find_or_create_by(name: tag)
      @resource.tags << t
    end
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
