class MonstersController < ApplicationController

  get "/monsters/new" do
    @user = User.find(session[:user_id])
    erb :'/monsters/new'
  end

  post "/monsters" do
    @user = User.find(session[:user_id])
    @monster = Monster.create(params["monsters"])
    @monster.color = @user.favorite_color
    @monster.favorite_food = @user.favorite_food
    @monster.level = 1
    @monster.exp_points = 0
    @monster.user_id = @user.id
    @monster.save
    
    redirect "/monsters/#{@monster.id}"
  end

  get "/monsters/:id" do
    @user = User.find(session[:user_id])
    @monster = Monster.find(params[:id])

    erb :'monsters/show'
  end

  get "/monsters/:id/edit" do
    @user = User.find(session[:user_id])
    @monster = Monster.find(params[:id])
    erb :'monsters/edit'
  end

  patch "/monsters/:id" do
    @user = User.find(session[:user_id])
    @monster = Monster.find(params[:id])
    @monster.name = params[:name]
    @monster.save

    redirect "/monsters/#{@monster.id}"
  end

  delete "/monsters/:id" do
    @monster = Monster.find_by_id(params[:id])
    @monster.delete

    redirect '/monsters/new'
  end
end
