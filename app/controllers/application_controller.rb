require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, '/public'
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

  get '/sessions/logout' do
    session.clear
    redirect '/'
  end

  post '/sessions' do
    @user = User.find_by(email: params["email"])
    if @user != nil && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      erb :'errors/login'
    end
  end

end