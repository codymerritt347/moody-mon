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
      if @monster.user == current_user
        erb :'monsters/show'
      else
        erb :'alerts/error_login'
      end
    else
      erb :'alerts/error_login'
    end
  end

  get "/monsters/:id/edit" do
    if logged_in?
      @monster = Monster.find(params[:id])
      if @monster.user == current_user
        erb :'monsters/edit'
      else
        erb :'alerts/error_login'
      end
    else
      erb :'alerts/error_login'
    end
  end

  post "/monsters" do
    monster = Monster.new(params["monsters"])
    if monster.save
      monster.color = current_user.favorite_color
      monster.favorite_food = current_user.favorite_food
      monster.level = 1
      monster.exp_points = 0
      monster.user = current_user
      monster.image = "monster_neutral"
      monster.save
      redirect "/monsters/#{monster.id}"
    else
      redirect '/error'
    end
  end

  patch "/monsters/:id" do
    monster = Monster.find(params[:id])
    monster.update(params["monsters"])
    if monster.save
      redirect "/monsters/#{monster.id}"
    else
      redirect '/error'
    end
  end

  delete '/monsters/:id' do
    monster = Monster.find(params[:id])
    if monster.destroy
      redirect "/users/#{current_user.id}"
    else
      redirect '/error'
    end
  end
  
end
