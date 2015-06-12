class WelcomeController < ApplicationController
  skip_before_filter :authenticate_user!, only: :index
  layout false
  def index
    render :layout => false  
  end
end