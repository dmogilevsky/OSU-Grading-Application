class GraderAssignmentsController < ApplicationController
  def create
    GraderAssignment.create(student_id: params[:student_id], section_id: params[:section_id])
  end
end
