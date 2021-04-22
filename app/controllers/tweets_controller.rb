class TweetsController < ApplicationController

  get '/tweets' do
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      @tweets = Tweet.all
      erb :'tweets/index'
    else
      redirect to 'login'
    end
  end

  get '/tweets/new' do
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      erb :'tweets/new'
    else
      redirect to 'login'
    end
  end

  post '/tweets/new' do
    if !params[:content].empty?
      user = Helpers.current_user(session)
      @tweet = Tweet.new(content: params[:content], user_id: user.id)
      @tweet.save
      redirect to "tweets/#{@tweet.id}"
    end
  end

  get '/tweets/:id' do
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      @tweet = Tweet.find_by(id: params[:id])
      erb :'tweets/show'
    else
      redirect to 'login'
    end
  end

  get '/tweets/:id/edit' do
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      @tweet = Tweet.find_by(id: params[:id])
      erb :'tweets/edit'
    else
      redirect to 'login'
    end
  end

  patch '/tweets' do
    if !params[:content].empty?
      user = Helpers.current_user(session)
      @tweet = Tweet.new(content: params[:content], user_id: user.id)
      @tweet.save
      redirect to "tweets/#{@tweet.id}"
    end
  end

  delete '/tweets' do
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      @tweet = Tweet.find_by(id: params[:id])
      @tweet.delete
      erb :'tweets'
    else
      redirect to 'login'
    end
  end
end
