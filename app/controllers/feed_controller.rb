class FeedController < ApplicationController
  before_action :authenticate_user!

  def index
    @articles = current_user.get_feed
    redirect_to articles_path if @articles.empty?  
  end
end
