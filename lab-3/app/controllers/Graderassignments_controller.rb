class GraderassignmentsController < ApplicationController
  def create
    if Graderassignment.create(student_id: params[:student_id], section_id: params[:section_id]).persisted?

    else

    end
    redirect_to(admin_path)
  end
end