require "sinatra/base"
require "sinatra/reloader"
require "./lib/user"

class Sunrisebnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions


  get "/" do
    "Sunrise Bookings!"
  end

  get "/users/new" do
    erb :users

  end

  post "/users" do
    session[:username] = params[:username]
    User.create(email: params[:email], username: params[:username], password: params[:password])
    redirect "/user/homepage"
    
  end

  get "/user/homepage" do
    @username = session[:username]
    p @username
    erb :userhomepage
  end

  run! if app_file == $0
end
