require 'sinatra/base'
require 'sinatra/reloader'

class Sunrisebnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Sunrise Bookings!'
  end

  run! if app_file == $0
end
