class Admin::FeedbacksController < AdminController

  active_scaffold :feedback do |config|
    config.columns.add :course_name
    config.columns.exclude :created_at, :updated_at
    config.list.columns.exclude :course_instance
  end
  
end