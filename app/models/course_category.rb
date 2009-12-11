class CourseCategory < ActiveRecord::Base
  has_many :courses
  
  validates_uniqueness_of :name
end
