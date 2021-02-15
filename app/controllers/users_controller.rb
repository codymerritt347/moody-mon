class UsersController < ApplicationController

  get "/signup" do
    erb :"/users/signup"
  end

  post "/signup" do
    # if user.valid?
    #   session["user_id"] = user.id
    #   redirect "/monsters/new"
    # else
    #   redirect "/signup"
    # end
  end

  get "/users/:id" do
    erb :"/users/show"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end
