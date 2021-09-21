require 'sinatra/base'
require 'sinatra/reloader'
require './lib/listing'

class Sunrisebnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/listings' do
    @listing = Listing.all
    erb :listings
  end 

  run! if app_file == $0
end
