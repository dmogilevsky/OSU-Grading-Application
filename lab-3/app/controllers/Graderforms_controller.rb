class GraderformsController < ApplicationController

  def delete_graderform
    if current_user.admin? and current_user.approved
    Graderform.destroy(params[:id])
    end
    redirect_to(admin_path)
  end

  def create
    new_graderform = params[:graderform]
    Graderform.create(student_id: current_user.id, Form: new_graderform[:Form])
    redirect_to(root_path)
  end

  def edit
    new_graderform = Graderform.find(params[:id])
    respond_to do |format|
      format.html { render :edit, locals: { graderform: graderform } }
    end
  end

  def show
    redirect_to(graderform_path)
  end

  def update
    new_graderform = Graderform.find(params[:id])
    respond_to do |format|
      format.html do
        if graderform.update(params.require(:graderform).permit(:graderform))
          flash[:success] = 'Grader forms updated'
          redirect_to(root_path)
        else
          flash.now[:error] = 'Error: Grader forms could not be updated'
          render :edit, locals: { graderform: graderform }
        end
      end
    end
  end
end
