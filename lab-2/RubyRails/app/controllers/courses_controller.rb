class CoursesController < ApplicationController
  def index
    @pagy, @courses = pagy(Course.all)
    @pagy,@sections= pagy(Section.all)
  end

end
