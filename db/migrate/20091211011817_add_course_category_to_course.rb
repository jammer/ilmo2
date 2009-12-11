class AddCourseCategoryToCourse < ActiveRecord::Migration
  def self.up
    change_table :courses do |t|
      t.references :course_category
    end
  end

  def self.down
    change_table :courses do |t|
      t.remove :course_category_id
    end
  end
end
