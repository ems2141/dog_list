require 'sinatra/base'

class Dog < Sinatra::Application

  get '/' do
    dog_table = DB[:dog_list].all
    erb :index, locals: {dogs: dog_table}
  end

  post '/' do
    dog_table = DB[:dog_list]
    dog_table.insert(name: params[:dog_name])
    redirect '/'
  end

  get '/dog/:id' do
    dog_to_show = DB[:dog_list].where(id: params[:id]).first
    erb :show_dogs, :locals => {dog: dog_to_show}
  end

  get '/dog/:id/edit' do
    erb :edit, locals: {id: params[:id]}
  end

  put '/:id' do
    dog_table = DB[:dog_list]
    dog_table.where(id: params[:id]).update(name: params[:dog_name])
    redirect '/'
  end
end