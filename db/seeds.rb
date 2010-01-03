# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

overwrite = ENV['overwrite'] == "yes"
how_many_courses = ENV['courses'].to_i

puts "Usage: rake db:seed courses=<number of courses> <overwrite=true>" if how_many_courses <= 0 # to_i returns 0 if ENV['courses'] is empty


# delete_all does not fire destroy-callbacks, so use destroy all
Course.destroy_all if overwrite

CourseCategory.create(:name => "Basic studies")
CourseCategory.create(:name => "Intermediate studies")
CourseCategory.create(:name => "Advanced studies")
CourseCategory.create(:name => "Others")
basic = CourseCategory.find_by_name("Basic studies")
inter = CourseCategory.find_by_name("Intermediate studies")
advan = CourseCategory.find_by_name("Advanced studies")
other = CourseCategory.find_by_name("Others")
categories = [basic,inter,advan,other]

for i in 1..how_many_courses
  c = Course.create(:name => "#{'Course #' + i.to_s}", :description => "Non eram nescius, Brute, cum, quae summis ingeniis exquisitaque doctrina philosophi Graeco sermone tractavissent, ea Latinis litteris mandaremus, fore ut hic noster labor in varias reprehensiones incurreret. nam quibusdam, et iis quidem non admodum indoctis, totum hoc displicet philosophari")
  ci = CourseInstance.create(:name => "Spring 2010")
  ci2 = CourseInstance.create(:name => "Summer 2010")
  ci3 = CourseInstance.create(:name => "Fall 2010")
  eg = ExerciseGroup.create(:name => "Group 1", :max_students => 10)
  eg2 = ExerciseGroup.create(:name => "Group 2", :max_students => 2)
  ci.exercise_groups = [eg, eg2]
  eg_ci2 = ExerciseGroup.create(:name => "Group 1", :max_students => 10)
  eg2_ci2 = ExerciseGroup.create(:name => "Group 2", :max_students => 2)
  ci2.exercise_groups = [eg_ci2, eg2_ci2]
  eg_ci3 = ExerciseGroup.create(:name => "Group 1", :max_students => 10)
  eg2_ci3 = ExerciseGroup.create(:name => "Group 2", :max_students => 2)
  ci3.exercise_groups = [eg_ci3, eg2_ci3]
  c.course_instances = [ci, ci2, ci3]
  se = SeparateExam.create(:name => "Separate exam 2010")
  c.separate_exams << se
  # FIXME: This could be replaced with helper cycle()
  category = categories.shift
  categories << category
  c.course_category = category
  c.save
end
