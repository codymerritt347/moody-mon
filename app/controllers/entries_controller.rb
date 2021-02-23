class EntriesController < ApplicationController

  get "/entries" do
    if logged_in?
      if @user.entries != []
        @entries = Entry.all.select {|entry| entry.user_id == @user.id}
        erb :'entries/index'
      else
        erb :'alerts/error_entries'
      end
    else
      erb :'alerts/error_login'
    end
  end

  get "/entries/new" do
    if logged_in?
      erb :'entries/new'
    else
      erb :'alerts/error_login'
    end
  end

  get "/entries/new/success" do
    if logged_in?
      erb :'alerts/success_entry'
    else
      erb :'alerts/error_login'
    end
  end

  get "/entries/:id" do
    if current_user
      @entry = Entry.find(params[:id])
      erb :"/entries/show"
    else
      erb :'alerts/error_login'
    end
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
    if current_user
      @user = User.find(current_user.id)
      @monster = Monster.find_by(user_id: current_user.id)
      @entry = Entry.new(params["entries"])
      if @entry
        @entry.user_id = current_user.id
        @entry.save
        @user.coins += 10
        @user.save
        @monster.exp_points += 15
        level_check(@monster)
        @monster.save
        redirect '/entries/new/success'
      else
      erb :'alerts/error_entry'
      end
    else
      erb :'alerts/error_login'
    end
  end

  patch "/entries/:id" do
    @user = current_user
    @entry = Entry.find(params[:id])
    @entry.time_of_day = params["time_of_day"]
    @entry.feeling = params["feeling"]
    @entry.intensity = params["intensity"]
    @entry.situation = params["situation"]
    @entry.save
    redirect "/entries/#{@entry.id}"
  end

  delete "/entries/:id" do
    @user = current_user
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
  end

end