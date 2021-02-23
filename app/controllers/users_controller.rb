class UsersController < ApplicationController

  get '/users/signup' do
    erb :"/users/signup"
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    erb :"/users/show"
  end

  get '/users/:id/edit' do
    @user = User.find(params[:id])
    erb :"/users/edit"
  end

  post '/users' do
    @user = User.new(params["users"])
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect '/monsters/new'
    else
      erb :error
    end
  end

  patch '/users/:id' do
    @user = User.new(params["users"])
    redirect '/users/:id'
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
