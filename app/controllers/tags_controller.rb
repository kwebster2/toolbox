class TagsController < ApplicationController

  def index
    cohort = Cohort.find_by(slug: params[:cohort_slug])
    cohort_id = cohort.id
    @tags = Tag.search(params[:term], cohort_id)
    render json: @tags.map(&:name).uniq
  end

end
