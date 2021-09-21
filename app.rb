require "sinatra/base"
require "sinatra/reloader"

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
    Users.create(email: params[:email], username: params[:username], password: params[:password])
    session[:username] = params[:username]
    redirect "/user/homepage"
  end

  get "/user/homepage" do
    @username = session[:username]
    erb :userhomepage
  end

  run! if app_file == $0
end

# If post is not used

# get '/user/new' do

#   sign up forms etc
#   capture information(name,email,password)
#   sign up / submit ---- > redirect to new page(userhomepage)

# end

# get 'userhomepage/' do

#   parameters stored in url

#   name = Example
#   email = test@example.com

#   "Welcome #{name}"

# end

# if post method is used

#   get '/user/new' do

#     sign up forms etc
#     capture information(name,email,password)
#     sign up / submit ---- > redirect to new page(user/information)
#     post method

#   end

#   <form action="/users" method="post">
#   <input type="email" name="email" />
#   <input type="password" name="password" />
#   <input type="submit" value="Submit" />
# </form>

#   post 'user/information'

#   name = params[:name]
#   email = params[:email]

#   redirect 'userhomepage'

#   end

#   get 'userhomepage/' do

#     @ name = name

#    erb  "Welcome #{@name}"

#   end
