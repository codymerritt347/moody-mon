class MonstersController < ApplicationController

  # GET: /monsters/new
  get "/monsters/new" do
    @user = User.find(session[:user_id])
    erb :'/monsters/new'
  end

  # POST: /monsters
  post "/monsters" do
    user = User.find(session[:user_id])
    monster = Monster.create(params["monsters"])
    monster.color = user.favorite_color
    monster.favorite_food = user.favorite_food
    monster.level = 1
    monster.exp_points = 0
    monster.user_id = user.id
    monster.save
    
    redirect "/monsters/#{monster.id}"
  end

  # GET: /monsters/5
  get "/monsters/:id" do
      @monster = Monster.find(params[:id])

      erb :'monsters/show'
  end

  # GET: /monsters/5/edit
  get "/monsters/:id/edit" do
    @monster = Monster.find(params[:id])
    binding.pry
    
    erb :'monsters/edit'
  end

  # PATCH: /monsters/5
  patch "/monsters/:id" do

  end

  # DELETE: /monsters/5/delete
  delete "/monsters/:id/delete" do

  end
end
