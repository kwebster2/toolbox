class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]

  def new
    @category = Category.new(cohort: Cohort.find_by(slug: params[:cohort_slug]))
  end

  def create
    category = Category.find_or_create_by(category_params)
    category.update(cohort_id: params["cohort_id"])
    category.save

    refer = request.env["HTTP_REFERER"].split("/")
    if refer.length > 5
      redirect_to cohort_category_path(refer[refer.length-3], category.slug)
    else
      redirect_to cohort_path(category.cohort.slug)
    end
  end

  def show
    @resources = @category.resources.page(params[:page]).per(10)
  end

  private

  def set_category
    @category = Category.find_by(slug: params[:slug])
    @cohort = @category.cohort
    @resource = Resource.new
  end

  def category_params
    params.require(:category).permit(:name, :cohort_id)
  end

end
