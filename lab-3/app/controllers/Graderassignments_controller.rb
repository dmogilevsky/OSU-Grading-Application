class GraderassignmentsController < ApplicationController
  def create
    Graderassignment.create(student_id: params[:student_id], section_id: params[:section_id])
    redirect_to(show_graderform_path(Graderform.find_by(student_id: params[:student_id])))
  end
end