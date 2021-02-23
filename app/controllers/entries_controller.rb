class EntriesController < ApplicationController
  
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

  get "/entries" do
    if logged_in?
      if current_user.entries != []
        @entries = current_user.entries
        erb :'entries/index'
      else
        erb :'alerts/error_login'
      end
    else
      erb :'alerts/error_login'
    end
  end

  get "/entries/:id" do
    if logged_in?
      @entry = Entry.find(params[:id])
      if @entry.user == current_user
        erb :'entries/show'
      else
        erb :'alerts/error_login'
      end
    else
      erb :'alerts/error_login'
    end
  end

  get "/entries/:id/edit" do
    if logged_in?
      @entry = Entry.find(params[:id])
      if @entry.user == current_user
        erb :'entries/edit'
      else
        erb :'alerts/error_login'
      end
    else
      erb :'alerts/error_login'
    end
  end

  post "/entries" do
    if current_user
      user = current_user
      monster = user.monster
      entry = user.entries.build(params["entries"])
      if entry.save
        user.coins += 10
        user.save
        monster.exp_points += 15
        level_check(monster)
        monster.save
        redirect '/entries/new/success'
      else
      erb :'alerts/error_entry'
      end
    else
      erb :'alerts/error_login'
    end
  end

  patch "/entries/:id" do
    entry = Entry.find(params[:id])
    entry.time_of_day = params["time_of_day"]
    entry.feeling = params["feeling"]
    entry.intensity = params["intensity"]
    entry.situation = params["situation"]
    entry.save
    redirect "/entries/#{@entry.id}"
  end

  delete "/entries/:id" do
    entry = Entry.find(params[:id])
    entry.destroy
    redirect '/entries'
  end

  helpers do
    def level_check(monster)
      if monster.exp_points >= 100
        monster.level += 1
        new_exp = monster.exp_points - 100
        monster.exp_points = new_exp
      end
    end
  end

end