set :application, "ilmo"
set :repository,  "git://github.com/jammer/ilmo2.git"
set :scm, :git

set :deploy_to, "/home/opsuomi/cap"

set :user, "opsuomi"
set :use_sudo, false

set :gateway, "db.cs.helsinki.fi"

role :web, "rails.cs.helsinki.fi"
role :app, "rails.cs.helsinki.fi"
role :db,  "rails.cs.helsinki.fi", :primary => true

set :rake, "/opt/ruby-enterprise-1.8.7-2009.10/bin/rake"

namespace :deploy do
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  task :symlink_shared do
    run "ln -s #{shared_path}/database.yml #{release_path}/config/"
  end
end
  
desc "Seed the database with some courses"
task :seed do
  run "cd #{current_release}; RAILS_ENV=production #{rake} db:seed courses=20 overwrite=yes"
end

desc "Look at production log"
task :log do
  run "tail --lines=100 #{shared_path}/log/production.log"
end

# Symlink the config before other stuff
before "deploy:symlink", "deploy:symlink_shared"
# Migrate after symlinking
after "deploy:symlink", "deploy:migrate"
