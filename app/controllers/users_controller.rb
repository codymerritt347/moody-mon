class UsersController < ApplicationController

  get '/users/signup' do
    erb :"/users/signup"
  end

  get '/users/:id' do
    if logged_in?
      erb :"/users/show"
    else
      erb :"/alerts/error_login"
    end
  end

  get '/users/:id/edit' do
    if logged_in?
      erb :"/users/edit"
    else
      erb :"/alerts/error_login"
    end
  end

  post '/users' do
    user = User.new(params[:users])
    if user.save
      session[:user_id] = user.id
      user.coins = 0
      user.streak = 0
      user.save
      redirect '/monsters/new'
    else
      redirect '/error'
    end
  end

  patch '/users/:id' do
    if logged_in?
      current_user.update(params)
      if current_user.save
        redirect "/users/#{user.id}"
      else
        redirect '/error'
      end
    else
      redirect '/error'
    end
  end

  delete '/users/:id' do
    if current_user.destroy
      redirect '/'
    else
      redirect '/error'
    end
  end
  
end
