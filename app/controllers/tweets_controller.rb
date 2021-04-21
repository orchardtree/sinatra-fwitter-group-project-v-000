class TweetsController < ApplicationController

  get '/tweets' do
    if logged_in?
      @user = current_user
      @tweets = Tweet.all
      erb :'tweets/index'
    else
      redirect to 'users/login'
    end
  end

  get '/new' do
    @user = current_user
    erb :'tweets/new'
  end
end
