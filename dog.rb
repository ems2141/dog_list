require 'sinatra/base'

class Dog < Sinatra::Application

  get '/' do
    dog_table = DB[:dog_list].all
    erb :index, locals: {doggies: dog_table}
  end

  post '/' do
    dog_table = DB[:dog_list]
    dog_table.insert(name: params[:dog_name])
    redirect '/'
  end
end