class PagesController < ApplicationController
  skip_before_filter :authenticate_user!, only: :test
  def index
  end
end