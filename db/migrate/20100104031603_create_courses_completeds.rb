class CreateCoursesCompleteds < ActiveRecord::Migration
  def self.up
    create_table :courses_completeds do |t|
      t.references :user
      t.references :course

      t.timestamps
    end
  end

  def self.down
    drop_table :courses_completeds
  end
end
