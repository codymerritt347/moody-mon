class MonstersController < ApplicationController

  # GET: /monsters/new
  get "/monsters/new" do
    erb :'/monsters/new.html'
  end

  # POST: /monsters
  post "/monsters" do

  end

  # GET: /monsters/5
  get "/monsters/:id" do

  end

  # GET: /monsters/5/edit
  get "/monsters/:id/edit" do

  end

  # PATCH: /monsters/5
  patch "/monsters/:id" do

  end

  # DELETE: /monsters/5/delete
  delete "/monsters/:id/delete" do

  end
end
