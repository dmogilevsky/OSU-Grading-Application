class UsersController < ApplicationController

  def Users
  end
  def approve_user
    user = User.find(params[:id])
    user.approved = 1
    if user.save
      flash[:notice] = "#{user.id} ur mum"
    else
      flash[:alert] = "#{user.id} ur dud"
    end
    redirect_back(fallback_location: admin_path)
  end

end
