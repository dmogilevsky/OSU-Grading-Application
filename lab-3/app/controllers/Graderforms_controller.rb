class GraderformsController < ApplicationController

  def delete_grader
    Graderform.delete(params[:id])
    redirect_to(admin_path)
  end

  def create
    new_graderform = params[:graderform]
    Graderform.create(student_id: current_user.id, Form: new_graderform[:Form])
    redirect_to(root_path)
  end

  def edit
    grader = Graderform.find(params[:id])
    respond_to do |format|
      format.html { render :edit_graders, locals: { grader: grader } }
    end
  end

  def update
    grader = Graderform.find(params[:id])
    respond_to do |format|
      format.html do
        if grader.update(params.require(:grader).permit(:CourseNumber, :Grader))
          flash[:success] = 'Grader updated'
          redirect_to(grader_path)
        else
          flash.now[:error] = 'Error: Grader could not be updated'
          render :edit, locals: { grader: grader }
        end
      end
    end
  end
end