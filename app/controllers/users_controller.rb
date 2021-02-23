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
    current_user.name = params["name"]
    current_user.email = params["email"]
    current_user.password = params["password"]
    current_user.favorite_color = params["favorite_color"]
    current_user.favorite_food = params["favorite_food"]
    current_user.save
    redirect "/users/#{user.id}"
  end

  delete '/users/:id' do
    current_user.destroy
    redirect '/'
  end
  
end
