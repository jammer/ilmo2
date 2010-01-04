class Admin::ExerciseGroupsController < AdminController

  active_scaffold :exercise_groups do |config|
   config.columns.exclude :registered_users, :queued_users, :rejected_users, :accepted_users
  end
  
end
