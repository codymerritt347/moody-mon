class MonstersController < ApplicationController

  get '/monsters' do
    erb :'monsters/show'
  end

end