class AdminPageController < ApplicationController

  def index
    courses = Course.all
    respond_to do |f|
      f.html { render :index, locals: { courses: courses } }
    end
  end
end
