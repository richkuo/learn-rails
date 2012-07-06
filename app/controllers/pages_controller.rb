class PagesController < ApplicationController
  def home
    @micropost = current_user.microposts.build if signed_in?
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
