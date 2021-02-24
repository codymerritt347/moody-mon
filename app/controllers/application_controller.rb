require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, '/public'
    set :views, 'app/views'
    enable :sessions unless test?
    set :session_secret, ENV['SESSION_SECRET']
    set :method_override, true
  end

  get '/' do
    erb :welcome
  end

  get '/error' do
    erb :'alerts/error'
  end

  get '/sessions/login' do
    erb :'sessions/login'
  end

  get '/sessions/logout' do
    session.clear
    redirect '/'
  end

  post '/sessions' do
    @user = User.find_by(email: params["email"])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      redirect '/error'
    end
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end

end