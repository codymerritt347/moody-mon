class EntriesController < ApplicationController

  get "/entries" do
    @user = User.find(session[:user_id])
    if @user.entries == []
      erb :'alerts/error_entries'
    else
      @entries = Entry.all.select {|entry| entry.user_id == @user.id}
      erb :'entries/index'
    end
  end

  get "/entries/new" do
    @user = User.find(session[:user_id])
    erb :'entries/new'
  end

  get "/entries/new/success" do
    @user = User.find(session[:user_id])
    @monster = Monster.find(@user.id)
    @user.coins += 10
    @monster.exp_points += 15
    level_check(@monster)
    @user.save
    erb :'alerts/success_entry'
  end

  get "/entries/:id" do
    @user = User.find(session[:user_id])
    @entry = Entry.find(params[:id])
    erb :"/entries/show"
  end

  get "/entries/:id/edit" do
    if current_user
      @entry = Entry.find(params[:id])
      erb :'/entries/edit'
    else
      erb :'/alerts/error_entry'
    end
  end

  post "/entries" do
    @user = User.find(session[:user_id])
    @entry = Entry.new(params["entries"])
    if @entry.valid?
      @entry.user_id = @user.id
      @entry.save
      redirect '/entries/new/success'
    else
      erb :'alerts/error_entry'
    end
  end

  patch "/entries/:id" do
    @user = User.new(params["users"])
    @entry = Entry.find(params[:id])
    @entry.time_of_day = params["time_of_day"]
    @entry.feeling = params["feeling"]
    @entry.intensity = params["intensity"]
    @entry.situation = params["situation"]
    @entry.save
    redirect "/entries/#{@entry.id}"
  end

  delete "/entries/:id" do
    @user = User.new(params["users"])
    @entry = Entry.find_by_id(params[:id])
    @entry.delete
    redirect '/entries'
  end

  private
  def level_check(monster)
    if monster.exp_points >= 100
      monster.level += 1
      new_exp = monster.exp_points - 100
      monster.exp_points = new_exp
    end
    monster.save
  end

end
