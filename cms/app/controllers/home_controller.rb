class HomeController < ApplicationController
  skip_before_filter :require_login, :only => [:index]
  def about
  end

  def index
    @user = User.new
  end

  def faq
  end

  def testimonial
  end

  def pricing
  end
end
