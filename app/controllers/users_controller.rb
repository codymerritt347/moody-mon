class UsersController < ApplicationController

  get '/users' do
    erb :'/users/index'
  end

  get '/users/new' do
    erb :'/users/new'
  end

end