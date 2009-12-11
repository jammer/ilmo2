ActionController::Routing::Routes.draw do |map|

  map.resource :session
  map.resources :users do |user|
    user.resources :friendships
  end
  
  map.resources :courses do |course|
    course.resources :separate_exams
    course.resources :course_instances do |course_instance|
      course_instance.resources :exercise_groups do |exercise_group|
        exercise_group.registration "/registration", :controller => :exercise_groups, :action => :registration
      end
    end
  end

  map.namespace(:admin) do |admin|
    admin.resources :users, :active_scaffold => true
    admin.resources :courses, :active_scaffold => true
    admin.resources :course_instances, :active_scaffold => true
    admin.resources :exercise_groups, :active_scaffold => true
    admin.resources :roles, :active_scaffold => true
    admin.resources :rights, :active_scaffold => true
    admin.resources :registrations, :active_scaffold => true
    admin.resources :separate_exams, :active_scaffold => true
    admin.resources :news, :active_scaffold => true
    admin.resource :mailer, :controller => "mailer"
  end
  
  map.resource :admin, :controller => :admin
  
  map.resource :newsfeed, :controller => "newsfeed" 
  
  map.resources :item do |newsfeed|
    newsfeed.resources :likes
  end
  
  map.login "/login", :controller=>:users, :action=>:index
  map.logout "/logout", :controller=>:sessions, :action=>:destroy

  map.root :controller => :courses 

end
