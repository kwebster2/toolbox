class CohortsController < ApplicationController
  before_action :set_cohort, only: [:show]

  def index
    @cohorts = Cohort.all
  end

  def show
  end

  private

  def set_cohort
    @cohort = Cohort.find_by(slug: params[:slug])
  end
end
