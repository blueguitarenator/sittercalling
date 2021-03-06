# $:.unshift(File.expand_path('./lib', ENV['rvm_path']))
# require 'rvm/capistrano'
require 'bundler/capistrano'
set :application, "sittercalling"
set :repository,  "git@github.com:blueguitarenator/sittercalling.git"
# set :rvm_ruby_string, '1.9.2@sittercalling'
# set :rvm_type, :user
set :scm, :git

set :scm_username, 'mybabysi'
set :user, 'sitter_cap'
set :use_sudo, false
set :branch, "master"
set :deploy_to, "/home/sitter_cap/#{application}"
set :deploy_via, :remote_cache
set :keep_releases, 5

role :web, "sittercalling.com"                          # Your HTTP server, Apache/etc
role :app, "sittercalling.com"                          # This may be the same as your `Web` server
role :db,  "sittercalling.com", :primary => true # This is where Rails migrations will run

set :bundle_dir, ''
set :bundle_flags, ''
set :bundle_without, [:development, :test, :cucumber]
# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

task :overwrite_database_yml_file do
  run "[ -f /home/sitter_cap/#{application}/database.yml ] && cp -f /home/sitter_cap/#{application}/database.yml #{latest_release}/config/ || echo 'database.yml was not overwritten'"
end

after "deploy:update_code", :overwrite_database_yml_file

# if deployment fails because you need to install gems,
# ssh as sitter_cap, go to the directory that was just deployed but failed
# su sitter_root (don't use su -, you want to stay in the same directory)
# run sudo bundle install --gemfile Gemfile --without development test
# then deploy again and should be good to go
