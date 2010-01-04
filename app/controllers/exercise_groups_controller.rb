class ExerciseGroupsController < ApplicationController

  def index
    @exercise_groups = ExerciseGroup.all
  end

  def show
    @exercise_group = ExerciseGroup.find(params[:id])
  end
  
  def registration
    exercise_group = ExerciseGroup.find(params[:exercise_group_id])
    course_instance = CourseInstance.find(params[:course_instance_id])
    
    registration = current_user.registrations.build :exercise_group => exercise_group

    if exercise_group.full? or exercise_group.course_instance.screen
      registration.queue = true
    else
      registration.queue = false
    end

    if registration.save
      if registration.queue
        flash[:notice] = 'Succesfully placed you to the queue for the exercise group.'
      else
        flash[:notice] = 'Succesfully registered to the exercise group.'
      end
    else
      flash[:error] = "You have already registered to this exercise group OR to this course instance"
    end

    redirect_to course_course_instance_exercise_group_path(course_instance.course, course_instance, exercise_group)
  end

end
