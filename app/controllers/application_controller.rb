require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_dir, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
  end

  get '/' do
    erb :welcome
  end

  get '/sessions/login' do
    erb :'sessions/login'
  end

  post 'sessions' do
    
  end

  get '/sessions/logout' do
    session.clear
  end

end