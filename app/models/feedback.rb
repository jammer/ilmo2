class Feedback < ActiveRecord::Base
  belongs_to :course_instance
  
  def course_name
    "#{course_instance.course.name} - #{course_instance.name}"
  end
end
