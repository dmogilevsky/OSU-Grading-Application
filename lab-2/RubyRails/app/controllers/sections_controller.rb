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
    section = Section.find(params[:id])
    respond_to do |format|
      format.html do
        if section.update(params.require(:section).permit(:SectionNumber, :Term))
          flash[:success] = 'Section updated successfully'
          redirect_to(courses_path)
        else
          flash.now[:error] = 'Error: Section could not be updated'
          render :edit, locals: { section: section }
        end
      end
    end
  end

  end