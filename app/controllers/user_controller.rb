class UserController < ApplicationController
  get '/users' do
    erb :'user/edit'
  end
end