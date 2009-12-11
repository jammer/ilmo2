class SeparateExamsController < ApplicationController
  def show
    @separate_exam = SeparateExam.find(params[:id])
  end
end