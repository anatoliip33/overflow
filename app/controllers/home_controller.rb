class HomeController < ApplicationController
  def index
    @users = User.order("created_at DESC")
  end
end
