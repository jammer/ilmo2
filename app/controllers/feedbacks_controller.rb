class FeedbacksController < ApplicationController
  def create
    @feedback = Feedback.new
    @feedback.feedback = params[:feedback]
    @feedback.course_instance = CourseInstance.find(params[:course_instance_id])
    
    if @feedback.save
      flash[:notice] = 'Feedback delivered!'
      redirect_to root_url
    else
      flash[:notice] = 'Failed to deliver feedback!'
      redirect_to root_url
    end
  end
end