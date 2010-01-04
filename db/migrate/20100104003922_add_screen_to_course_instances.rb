class AddScreenToCourseInstances < ActiveRecord::Migration
  def self.up
   change_table :course_instances do |t|
     t.boolean :screen, :default => false
   end
  end

  def self.down
   change_table :course_instances do |t|
     t.remove :screen
   end
  end
end
