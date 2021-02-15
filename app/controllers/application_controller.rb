require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_dir, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
  end

  get '/' do

  end

  get '/login' do

  end

end