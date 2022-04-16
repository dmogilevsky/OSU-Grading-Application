class RecommendationsController < ApplicationController
  def index
    @pagy, @reommendations= pagy(Recommendation.all.order(params[:sort]))
  end

  def write_recommendation
    student = User.find(params[:id])
    respond_to do |format|
      format.html { render :write_recommendation, locals: { student: student } }
    end
  end

  # Create a new course with given parameters
  def create
    recommendation = params[:recommendation]
    Recommendation.create!(instructor_id: current_user.id, student_id: recommendation[:student_id],
                          Recommendation: recommendation[:Recommendation])
    redirect_to(recommendations_path)
  end
end
