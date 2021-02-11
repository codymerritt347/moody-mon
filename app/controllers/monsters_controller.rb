class MonstersController < ApplicationController

  # GET: /monsters
  get "/monsters" do
    erb :"/monsters/index.html"
  end

  # GET: /monsters/new
  get "/monsters/new" do
    erb :"/monsters/new.html"
  end

  # POST: /monsters
  post "/monsters" do
    redirect "/monsters"
  end

  # GET: /monsters/5
  get "/monsters/:id" do
    erb :"/monsters/show.html"
  end

  # GET: /monsters/5/edit
  get "/monsters/:id/edit" do
    erb :"/monsters/edit.html"
  end

  # PATCH: /monsters/5
  patch "/monsters/:id" do
    redirect "/monsters/:id"
  end

  # DELETE: /monsters/5/delete
  delete "/monsters/:id/delete" do
    redirect "/monsters"
  end
end
