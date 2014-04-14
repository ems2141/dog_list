require 'sinatra/base'

class Dog < Sinatra::Application

  get '/' do
    dog_table = DB[:dog_list]
    erb :index, locals: {doggies: dog_table.to_a}
  end

  post '/' do
    dog_table = DB[:dog_list]
    dog_table.insert(name: params[:dog_name])
    redirect '/'
  end
end