class SubjectsController < ApplicationController
  before_action :set_subject

  def show
  end

  private
  def set_subject
    @subject = Subject.find_by(slug: params[:slug])
  end

end
