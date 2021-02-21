class UsersController < ApplicationController

  get '/users/signup' do
    erb :"/users/signup"
  end

  post '/users' do
    @user = User.new(params["users"])
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect '/monsters/new'
    else
      # ERROR ALERT - INCORRECT SIGN-UP
      erb :error
    end
  end

  get '/users/home' do
    @user = User.find(session[:user_id])
    erb :"/users/home"
  end

  # GET: /users/5/edit
  get '/users/:id/edit' do
    @user = User.find(params[:id])
    erb :"/users/edit"
  end

  # PATCH: /users/5
  patch '/users/:id' do
    redirect '/users/:id'
  end

  # DELETE: /users/5/delete
  delete '/users/:id/delete' do
    redirect '/users'
  end
end
