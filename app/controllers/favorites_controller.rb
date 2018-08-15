class FavoritesController < ApplicationController
  before_action :authenticated_user, only: {:create, :destroy}
  def create
    favorite = current_user.favorites.create(tweet_id: params[:tweet_id])
    redirect_to tweets_path, success: "#{favorite.tweet.user.name}さんのツイートをお気に入り登録しました。"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to tweets_path, success: "#{favorite.tweet.user.name}さんのツイートをお気に入り解除しました。"
  end

  private
  def authenticated_user
    unless current_user.present?
      redirect_to new_session_path, warning: "ログインしてください"
    end
  end
end
