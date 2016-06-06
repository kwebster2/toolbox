class SubjectsController < ApplicationController
  before_action :set_subject, only [:show]

  def show
  end

  private

  def set_subject
    @subject = Subject.find_by(slug: params[:slug])
  end

end
