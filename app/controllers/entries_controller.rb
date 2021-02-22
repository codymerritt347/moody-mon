class EntriesController < ApplicationController

  get "/entries" do
    @user = User.find(session[:user_id])
    @entries = Entry.all.select {|entry| entry.user_id == @user.id}

    erb :'entries/index'
  end

  get "/entries/new" do

    erb :'entries/new'
  end

  post "/entries" do
    # VALIDATION
    @user = User.find(session[:user_id])
    @entry = Entry.create(params["entries"])

    redirect "/entries/#{@entry.id}"
  end

  get "/entries/:id" do
    @entry = Entry.find(params[:id])
    
    erb :"/entries/show"
  end

  get "/entries/:id/edit" do
    @entry = Entry.find(params[:id])
    
    erb :'/entries/edit'
  end

  patch "/entries/:id" do
    @entry = Entry.find(params[:id])
    @entry.time_of_day = params["time_of_day"]
    @entry.feeling = params["feeling"]
    @entry.intensity = params["intensity"]
    @entry.situation = params["situation"]
    @entry.save

    redirect "/entries/#{@entry.id}"
  end

  delete "/entries/:id/delete" do
    @entry = Entry.find_by_id(params[:id])
    @entry.delete

    redirect '/entries'
  end
end
