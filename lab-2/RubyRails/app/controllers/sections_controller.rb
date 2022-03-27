class SectionsController < ApplicationController
  def delete_section
    Section.delete(params[:id])
    redirect_to(courses_path)
  end

  def create
    new_section= params[:section]
    Section.create(Term: new_section[:Term], course_id: new_section[:CourseID],
    SectionNumber: new_section[:SectionNumber])
    redirect_to(courses_path)
  end

  def edit
    section = Section.find(params[:id])
    respond_to do |format|
      format.html { render :edit_sections, locals: { section: section } }
    end
  end

  def update
    section = Course.find(params[:id])
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

  def update_section
    section = Section.find(params[:id])
    section.Term = params[:term]
    section.SectionNumber = params[:sectionnumber]
    section.course_id = params[:course_id]
    section.save
  end
  end