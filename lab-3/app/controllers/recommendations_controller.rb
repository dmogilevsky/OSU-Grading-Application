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
    Recommendation.create(Instructor_ID: recommendation[:Instructor_ID], Student_ID: recommendation[:Student_ID],
                          Recommendation: recommendation[:Recommendation])
    redirect_to(recommendation_path)
  end
end
