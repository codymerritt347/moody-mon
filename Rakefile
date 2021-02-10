ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

set :database_file, 'database.yml'

desc "ev_console"
task :ev_console => :setup_env do
  ARGV.clear
  IRB.start
end