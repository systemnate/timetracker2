class WelcomeController < ApplicationController
  skip_before_filter :authenticate_user!
  def index
    render :layout => false
  end

  def documentation
  end

  def test
    render :layout => false
  end
end
