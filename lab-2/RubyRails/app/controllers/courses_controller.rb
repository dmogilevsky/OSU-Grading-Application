class CoursesController < ApplicationController
  def index
    @courses = Course.all
    @sections = Section.all
  end
end
