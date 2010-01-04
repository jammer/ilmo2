class ExerciseGroup < ActiveRecord::Base

  belongs_to :course_instance

  has_many :registrations
  has_many :users, :through => :registrations
  has_many :registered_users, :source => :user, :through => :registrations, :conditions => 'queue = 0'
  has_many :queued_users, :source => :user, :through => :registrations, :conditions => 'queue = 1'
  has_many :accepted_users, :source => :user, :through => :registrations, :conditions => 'queue = 0 and accepted = 1'
  has_many :rejected_users, :source => :user, :through => :registrations, :conditions => 'queue = 0 and accepted = 0'

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
