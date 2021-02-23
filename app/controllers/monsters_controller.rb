class MonstersController < ApplicationController

  get "/monsters/new" do
    if logged_in?
      erb :'/monsters/new'
    else
      erb :'alerts/error_login'
    end
  end

  get "/monsters/:id" do
    if logged_in?
      @monster = Monster.find(params[:id])
      erb :'monsters/show'
    else
      erb :'alerts/error_login'
    end
  end

  get "/monsters/:id/edit" do
    if logged_in?
      @monster = Monster.find(params[:id])
      erb :'monsters/edit'
    else
      erb :'alerts/error_login'
    end
  end

  post "/monsters" do
    @user = current_user
    @monster = Monster.new(params["monsters"])
    if @monster
      @monster.color = @user.favorite_color
      @monster.favorite_food = @user.favorite_food
      @monster.level = 1
      @monster.exp_points = 0
      @monster.user_id = @user.id
      @monster.image = "monster_neutral"
      @monster.save
      redirect "/monsters/#{@monster.id}"
    else
      erb :'alerts/error_monster'
    end
  end

  patch "/monsters/:id" do
    @user = current_user
    @monster = Monster.find(params[:id])
    @monster.name = params[:name]
    @monster.color = params[:color]
    @monster.favorite_food = params[:favorite_food]
    @monster.save
    redirect "/monsters/#{@monster.id}"
  end

  delete "/monsters/:id" do
    @user = current_user
    @monster = Monster.find(params[:id])
    @monster.destroy
    redirect '/monsters/new'
  end
  
end
