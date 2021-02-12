class MonstersController < ApplicationController

  # GET: /monsters/new
  get "/monsters/new" do
    erb :"/monsters/new.html"
  end

  # POST: /monsters
  post "/monsters" do
    monster = Monster.create(params["monster"])
    monster.level = 1
    monster.current_health = 10
    monster.max_health = 10
    monster.user_id = session["user_id"]
    monster.save
    redirect "/monsters/#{monster.id}"
  end

  # GET: /monsters/5
  get "/monsters/:id" do
    @monster = Monster.find(params[:id])
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
