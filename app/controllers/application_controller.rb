require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, "public"
    set :views, "app/views"
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do
    erb :'index'
  end

  get '/signup' do
    erb :'signup'
  end

  post '/signup' do
    user = User.new(user[:params])
    if user.save
      redirect "/"
    else
      redirect "/tweets"
    end
  end

end
