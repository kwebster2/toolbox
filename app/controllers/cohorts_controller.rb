class CohortsController < ApplicationController
  before_action :set_cohort, only: [:show]

  def index
      @cohorts = Cohort.all
  end

  def show
    if params[:search]
      tags = params[:search].split(", ").flatten
      @resources = @cohort.resources.includes(:tags).where(:tags => {name: tags})
    else
      @resources = @cohort.resources
    end
  end

  private
  def set_cohort
    @cohort = Cohort.find_by(slug: params[:slug])
    @resource = Resource.new
  end
end
