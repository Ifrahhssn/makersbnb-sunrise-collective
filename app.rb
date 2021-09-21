require 'sinatra/base'
require 'sinatra/reloader'

class Sunrisebnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/listings' do 
    erb :listings
  end 

  run! if app_file == $0
end
