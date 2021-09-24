require "sinatra/base"
require "sinatra/reloader"
require "./lib/user"
require "./lib/listing"
require "sinatra/flash"

class Sunrisebnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    register Sinatra::Flash
  end

  enable :sessions

  get "/" do
    erb :index
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
    if session[:username] == nil
      redirect "/"
    else
      @username = session[:username]
      p @username
      erb :userhomepage
    end
  end

  get "/listings/new" do
    erb :new_listing
  end

  get "/listings" do
    @listing = Listing.all
    erb :listings
  end

  post "/listings" do
    Listing.create(listing_name: params[:listing_name])
    # listing_name = params['listing_name']
    # connection = PG.connect(dbname: 'sunrise_bnb_manager_test')
    # connection.exec("INSERT INTO listings (listing_name) VALUES('#{listing_name}')")
    redirect "/listings"
  end

  get "/sessions/new" do
    erb :new_sessions
  end

  post "/sessions" do
    user = User.authenticate(email: params[:email], password: params[:password])
    session[:username] = user.username
    redirect "/user/homepage"
  end

  post "/sessions/destroy" do
    session.clear
    flash[:notice] = "You have signed out"
    redirect "/"
  end

  # get "/user_login/homepage" do
  # end

  run! if app_file == $0
end
