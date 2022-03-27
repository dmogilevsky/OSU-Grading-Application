class CoursesController < ApplicationController
  def index
    @pagy,@courses = pagy(Course.all.order(params[:sort]))
    @pagy,@sections= pagy(Section.all)
  end
  def delete_course
    sections = Section.where("course_id=?", params[:id])
    sections.each do |section|
      Section.delete(section.id)
    end
    Course.delete(params[:id])
    redirect_to(courses_path)
  end
  def add_course
    Course.create(Subject: subject,CourseNumber: coursenumber,
                  CourseName: name, Campus: campus, Career: career)
  end
  def edit_course
    course = Course.find(params[:id])
    course.CourseName = params[:name]
    course.Subject = params[:subject]
    course.CourseNumber = params[:coursenumber]
    course.Campus = params[:campus]
    course.Career = params[:career]
    course.save
  end
  end



