class RecommendationsController < ApplicationController
  def write_recommendation
    student = User.find(params[:id])
    respond_to do |format|
      format.html { render :write_recommendation, locals: { student: student } }
    end
  end
end
