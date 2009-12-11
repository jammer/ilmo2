require 'spec_helper'

describe Feedback do
  before(:each) do
    @valid_attributes = {
      :feedback => "value for feedback"
    }
  end

  it "should create a new instance given valid attributes" do
    Feedback.create!(@valid_attributes)
  end
end
