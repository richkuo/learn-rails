class PagesController < ApplicationController
before_filter :signed_in_user, only: [:brogramming, :fitness]

  def home
    if signed_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
    @user = User.new unless signed_in?
  end

  def brogramming
  end

  def fitness
  end

  def about
  end

  def contact
  end

end
