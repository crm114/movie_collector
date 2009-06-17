set :application, "fb_movie_collector"
set :repository,  "git@github.com:invalidusrname/movie_collector.git"
set :scm, :git
set :user, 'inali'
set :use_sudo, false
set :user, 'deploy'

set :deploy_to, "/home/#{user}/www/#{application}"

role :app, "fb.invalid8.com"
role :web, "fb.invalid8.com"
role :db,  "fb.invalid8.com", :primary => true

namespace :mod_rails do
  desc <<-DESC
  Restart the application altering tmp/restart.txt for mod_rails.
  DESC
  task :restart, :roles => :app do
    run "touch  #{release_path}/tmp/restart.txt"
  end
end

namespace :deploy do
  %w(start restart).each { |name| task name, :roles => :app do mod_rails.restart end }
end


namespace :db do
  desc "Make symlink for database yaml" 
  task :symlink do
    run "ln -nfs #{shared_path}/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/facebooker.yml #{release_path}/config/facebooker.yml"
  end
end

after "deploy:update_code", "db:symlink" 
