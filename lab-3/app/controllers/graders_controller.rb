class GradersController < ApplicationController
  def delete_grader
    Grader.delete(params[:id])
    redirect_to(admin_path)
  end

  def create
    new_grader= params[:grader]
    Grader.create(email: new_grader[:email], CourseNumber: new_grader[:CourseNumber], Grade: new_grader[:Grade], Availability: new_grader[:Availability])
    redirect_to(admin_path)
  end

  def edit
    grader = Grader.find(params[:id])
    respond_to do |format|
      format.html { render :edit_graders, locals: { grader: grader } }
    end
  end

  def update
    grader = Grader.find(params[:id])
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
