require 'spec_helper'

describe CoursesCompleted do
  before(:each) do
    @valid_attributes = {
      :user_id => 1,
      :course_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    CoursesCompleted.create!(@valid_attributes)
  end
end
