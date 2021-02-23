class MonstersController < ApplicationController

  get "/monsters/new" do
    @user = User.find(session[:user_id])
    erb :'/monsters/new'
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

  post "/monsters" do
    @user = User.find(session[:user_id])
    @monster = Monster.new(params["monsters"])
    if @monster.valid?
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
    @user = User.find(session[:user_id])
    @monster = Monster.find(params[:id])
    @monster.name = params[:name]
    @monster.color = params[:color]
    @monster.favorite_food = params[:favorite_food]
    @monster.save
    redirect "/monsters/#{@monster.id}"
  end

  delete "/monsters/:id" do
    @user = User.find(session[:user_id])
    @monster = Monster.find_by_id(params[:id])
    @monster.destroy
    redirect '/monsters/new'
  end

  helpers do
    def level_check
      if self.exp_points >= 100
        self.level += 1
        new_exp = self.exp_points - 100
        self.exp_points = new_exp
        self.save
      end
    end
  end

end
