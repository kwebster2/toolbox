class ResourcesController < ApplicationController

  def new
    @resource = Resource.new
  end

  def create
    binding.pry
  end

  private

  def resource_params
    params.require(:resource).permit(:name, :description, :url, :subject_id)
  end
end
