class CoursesController < ApplicationController

  def index
    @course_categories = CourseCategory.all
    
    respond_to do |format|
      format.html
      format.pdf { send_data PdfExport.all_courses(@course_categories) }
    end
  end

  def show
    @course = Course.find(params[:id])
  end

end
