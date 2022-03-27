class AdminCoursesController < ApplicationController
  def index
    @pagy,@courses = pagy(Course.all.order(params[:sort]))
    @pagy,@sections= pagy(Section.all)
  end

  # TODO add new course
  def add

  end

  # TODO: delete course by courseID
  def delete
    #@course = Course.find(params[:id])
    #@course.update course_params

  end

  # TODO change course attributes(Subject,	CourseNumber,	CourseName,	Campus,	Career,)
  def change
    # @course = Course.find(params[:id])
    # @course.update course_params

  end
end
