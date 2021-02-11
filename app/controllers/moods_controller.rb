class MoodsController < ApplicationController

  # GET: /moods
  get "/moods" do
    erb :"/moods/index.html"
  end

  # GET: /moods/new
  get "/moods/new" do
    erb :"/moods/new.html"
  end

  # POST: /moods
  post "/moods" do
    redirect "/moods"
  end

  # GET: /moods/5
  get "/moods/:id" do
    erb :"/moods/show.html"
  end

  # GET: /moods/5/edit
  get "/moods/:id/edit" do
    erb :"/moods/edit.html"
  end

  # PATCH: /moods/5
  patch "/moods/:id" do
    redirect "/moods/:id"
  end

  # DELETE: /moods/5/delete
  delete "/moods/:id/delete" do
    redirect "/moods"
  end
end
