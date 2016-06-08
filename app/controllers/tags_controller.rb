class TagsController < ApplicationController

  def index
    # cohort = Cohort.find_by(slug: params[:cohort_slug])
    # cohort_id = cohort.id
      @tags = Tag.search(params[:term])
      render json: @tags.pluck(:name).uniq
  end
end
