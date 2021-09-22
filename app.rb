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

  get '/listings/new' do
    erb :new_listing
  end

  get '/listings' do
    @listing = Listing.all
    erb :listings
  end 

  post '/listings' do
    Listing.create(listing_name: params[:listing_name])
    # listing_name = params['listing_name']
    # connection = PG.connect(dbname: 'sunrisebnb_test')
    # connection.exec("INSERT INTO listings (listing_name) VALUES('#{listing_name}')")
    redirect '/listings'
  end

  run! if app_file == $0
end
