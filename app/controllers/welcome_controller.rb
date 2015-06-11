class WelcomeController < ApplicationController
  skip_before_filter :authenticate_user!, only: :index

  def index
    render :layout => false  
  end
end