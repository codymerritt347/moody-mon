class EntriesController < ApplicationController

  # GET: /entries
  get "/entries" do
    user = User.find(session[:user_id])
    @entries = Entry.all.select {|entry| entry.user_id == user.id}

    erb :'entries/index'
  end

  # GET: /entries/new
  get "/entries/new" do

    erb :'entries/new'
  end

  # POST: /entries
  post "/entries" do
    user = User.find(session[:user_id])
    entry = Entry.create(params["entries"])

    redirect "/entries/#{entry.id}"
  end

  # GET: /entries/5
  get "/entries/:id" do
    @entry = Entry.find(params[:id])
    
    erb :"/entries/show"
  end

  # GET: /entries/5/edit
  get "/entries/:id/edit" do

  end

  # PATCH: /entries/5
  patch "/entries/:id" do

  end

  # DELETE: /entries/5/delete
  delete "/entries/:id/delete" do

  end
end
