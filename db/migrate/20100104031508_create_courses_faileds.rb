class CreateCoursesFaileds < ActiveRecord::Migration
  def self.up
    create_table :courses_faileds do |t|
      t.references :user
      t.references :course

      t.timestamps
    end
  end

  def self.down
    drop_table :courses_faileds
  end
end
