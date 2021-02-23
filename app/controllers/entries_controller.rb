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
        @entries = current_user.entries
        erb :'entries/index'
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
      redirect '/error'
      end
    else
      redirect '/error'
    end
  end

  patch "/entries/:id" do
    if logged_in?
      entry = Entry.find(params[:id])
      entry.update(params)
      if entry.save
        redirect "/entries/#{entry.id}"
      else
        redirect '/error'
      end
    else
      redirect '/error'
    end
  end

  delete "/entries/:id" do
    entry = Entry.find(params[:id])
    if entry.destroy
      redirect '/entries'
    else
      redirect '/error'
    end
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