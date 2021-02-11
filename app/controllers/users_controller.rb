class UsersController < ApplicationController

  get '/users' do
    erb :'/users/index'
  end

  get '/users/new' do
    erb :'/users/new'
  end

  get '/users/:id' do
    erb :'/users/show'
  end

end