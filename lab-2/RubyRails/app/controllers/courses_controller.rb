class CoursesController < ApplicationController
  def index
    @pagy,@courses = pagy(Course.all.order(params[:sort]))
    @pagy,@sections= pagy(Section.all)
  end
  end



