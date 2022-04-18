class GraderFormController < ApplicationController

  # Create a new course with given parameters
  def create
    graderform = params[:graderform]
    GraderForm.create!(student_id: graderform[:student_id],
                       Form: graderform[:Form])
  end
end
