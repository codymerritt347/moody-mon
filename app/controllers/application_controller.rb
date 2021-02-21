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

  post '/sessions' do
    @user = User.find_by(email: params["email"])
    if @user != nil && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect '/users/home'
    else
      # ERROR ALERT - INCORRECT LOG-IN
      erb :error
    end
  end

  get '/sessions/logout' do
    session.clear
    redirect '/'
  end

end