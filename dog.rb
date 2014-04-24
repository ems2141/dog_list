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

  get '/dog/:id' do
    dog_table = DB[:dog_list].all
    dog_to_show = dog_table.find(params[:id])

    erb :show_dogs, :locals => {dog: dog_to_show}
  end
end