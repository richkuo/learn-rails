class PagesController < ApplicationController
  def home
    if signed_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def brogramming
  end

  def fitness
  end

  def about
  end

  def contact
  end

  def signup
  end
end
