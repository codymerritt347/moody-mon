class EntriesController < ApplicationController

  get "/entries" do
    @user = User.find(session[:user_id])
    @entries = Entry.all.select {|entry| entry.user_id == @user.id}
    erb :'entries/index'
  end

  get "/entries/new" do
    @user = User.new(params["users"])
    erb :'entries/new'
  end

  get "/entries/:id" do
    @user = User.new(params["users"])
    @entry = Entry.find(params[:id])
    erb :"/entries/show"
  end

  get "/entries/:id/edit" do
    @user = User.new(params["users"])
    @entry = Entry.find(params[:id])
    erb :'/entries/edit'
  end

  post "/entries" do
    @user = User.find(session[:user_id])
    @entry = Entry.create(params["entries"])
    redirect '/entries'
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

  delete "/entries/:id/delete" do
    @user = User.new(params["users"])
    @entry = Entry.find_by_id(params[:id])
    @entry.delete
    redirect '/entries'
  end
  
end
