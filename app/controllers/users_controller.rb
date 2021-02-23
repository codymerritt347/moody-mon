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
    @user = User.new(params["users"])
    if @user
      @user.coins = 0
      @user.streak = 0
      @user.save
      session[:user_id] = @user.id
      redirect '/monsters/new'
    else
      erb :'/alerts/error_signup'
    end
  end

  patch '/users/:id' do
    @user = current_user
    @user.name = params["name"]
    @user.email = params["email"]
    @user.password = params["password"]
    @user.favorite_color = params["favorite_color"]
    @user.favorite_food = params["favorite_food"]
    @user.save
    redirect "/users/#{@user.id}"
  end

  delete '/users/:id' do
    @user = current_user
    @user.destroy
    redirect '/'
  end
  
end
