class CoursesController < ApplicationController
  def index
    @pagy, @courses = pagy(Course.all.order(params[:sort]))
    @pagy, @sections = pagy(Section.all)

    if params[:search]
      search_courses
    end
  end

  def search_courses
    @pagy, @courses = pagy(Course.where("CourseNumber LIKE ?", "%" + params[:search]+ "%"))
  end

  def delete_course
    sections = Section.where("course_id=?", params[:id])
    sections.each do |section|
      Section.delete(section.id)
    end
    Course.delete(params[:id])
    redirect_to(courses_path)
  end

  def create
    new_course = params[:course]
    Course.create(Subject: new_course[:Subject], CourseNumber: new_course[:CourseNumber],
                  CourseName: new_course[:CourseName], Campus: new_course[:Campus], Career: new_course[:Career])
    redirect_to(courses_path)
  end

  def edit
    course = Course.find(params[:id])
    respond_to do |format|
      format.html { render :edit_courses, locals: { course: course } }
    end
  end

  def update
    course = Course.find(params[:id])
    respond_to do |format|
      format.html do
        if course.update(params.require(:course).permit(:CourseName, :Subject, :CourseNumber, :Campus,
                                                        :Career))
          flash[:success] = 'Course updated successfully'
          redirect_to(courses_path)
        else
          flash.now[:error] = 'Error: Course could not be updated'
          render :edit, locals: { course: course }
        end
      end
    end
  end

  def update_course
    course = Course.find(params[:id])
    course.CourseName = params[:name]
    course.Subject = params[:subject]
    course.CourseNumber = params[:coursenumber]
    course.Campus = params[:campus]
    course.Career = params[:career]
    course.save
  end
end



