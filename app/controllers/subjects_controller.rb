class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show]

  def new
    @subject = Subject.new(category: Category.find_by(slug: params[:category_slug]))
  end

  def create
    @subject = Subject.create(subject_params)
    redirect_to cohort_category_subject_path(@subject.category.cohort.slug, @subject.category.slug, @subject.slug)
  end

  def show
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :category_id)
  end

  def set_subject
    @subject = Subject.find_by(slug: params[:slug])
  end

end
