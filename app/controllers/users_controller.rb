class UsersController < ApplicationController

  get '/users/signup' do
    erb :"/users/signup"
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    @monster = @user.monster
    erb :"/users/show"
  end

  get '/users/:id/edit' do
    @user = User.find(params[:id])
    @monster = Monster.find(@user.id)
    erb :"/users/edit"
  end

  post '/users' do
    @user = User.new(params["users"])
    if @user.valid?
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
    @user = User.find(session[:user_id])
    @user.name = params["name"]
    @user.email = params["email"]
    @user.password = params["password"]
    @user.favorite_color = params["favorite_color"]
    @user.favorite_food = params["favorite_food"]
    @user.save
    redirect "/users/#{@user.id}"
  end

  delete '/users/:id/delete' do
    @user = User.find(params[:id])
    redirect '/users'
  end

  helpers do

    def self.current_user(session)
      @user = User.find_by_id(session[:user_id])
    end

    def self.authenticated?(session)
      !!session[:user_id]
    end
    
  end
  
end
