class ResourcesController < ApplicationController

  def new
    @resource = Resource.new(subject_id: params["subject_id"])
  end

  def create
    @resource = Resource.create(resource_params)
    redirect_to cohort_category_path(@resource.category.cohort.slug, @resource.category.slug)
  end

  private
  def resource_params
    params.require(:resource).permit(:name, :description, :url, :subject_id)
  end
end
