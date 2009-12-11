class AddMaxStudentsToExerciseGroups < ActiveRecord::Migration
  def self.up
    change_table :exercise_groups do |t|
      t.integer :max_students
    end
  end

  def self.down
    change_table :exercise_groups do |t|
      t.remove :max_students
    end
  end
end
