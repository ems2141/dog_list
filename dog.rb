require 'sinatra/base'

class Dog < Sinatra::Application

  get '/' do
    erb :index
  end

  post '/' do
    params[:dog_name]
  end
end