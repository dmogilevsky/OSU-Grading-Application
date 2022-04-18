class GraderformController < ApplicationController

  # Create a new course with given parameters
  def create
    graderform = params[:graderform]
    Graderform.create!(student_id: graderform[:student_id],
                       Form: graderform[:Form])
  end
  def add_graderform

  end

end
