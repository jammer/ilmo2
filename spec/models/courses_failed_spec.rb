require 'spec_helper'

describe CoursesFailed do
  before(:each) do
    @valid_attributes = {
      :user_id => 1,
      :course_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    CoursesFailed.create!(@valid_attributes)
  end
end
