class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]

  def new
    @category = Category.new(cohort: Cohort.find_by(slug: params[:cohort_slug]))
  end

  def create
    @category = Category.create(category_params)
    binding.pry
    redirect_to cohort_category_path(@category.cohort.slug, @category.slug)
  end

  def show
  end

  private

  def set_category
    @category = Category.find_by(slug: params[:slug])
  end

  def category_params
    params.require(:category).permit(:name, :cohort_id)
  end

end
