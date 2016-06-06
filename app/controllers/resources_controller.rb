class ResourcesController < ApplicationController

  def new
    @resource = Resource.new(subject_id: params["subject_id"])
  end

  def create
    @resource = Resource.create(resource_params)
    redirect_to cohort_category_subject_path(@resource.subject.category.cohort.slug, @resource.subject.category.slug, @resource.subject.slug)
  end

  private

  def resource_params
    params.require(:resource).permit(:name, :description, :url, :subject_id)
  end
end
