class ExerciseGroup < ActiveRecord::Base

  belongs_to :course_instance

  has_many :registrations
  has_many :users, :through => :registrations

  def full?
    students >= max_students
  end
  
  def status
    "(#{students}/#{max_students})"
  end
  
  def students
    users.count
  end
end
