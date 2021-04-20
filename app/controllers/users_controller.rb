class UsersController < ApplicationController
  get '/' do
    erb :'users/homepage'
  end

  get '/signup' do
    if logged_in?
      erb :'users/signup'
    end

    if logged_in?
      redirect to 'tweets'
    else
      erb :'users/signup'
    end
  end

  post '/signup' do
    @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect to 'tweets'
    else
      redirect to 'signup'
    end
  end

  get 'login' do

  end

  helpers do
		def logged_in?
			!!session[:user_id]
		end

		def current_user
			User.find(session[:user_id])
		end
	end
end
