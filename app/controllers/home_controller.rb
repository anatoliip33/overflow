class HomeController < ApplicationController
  def index
    @users = User.all
    @questions = Question.order('created_at ASC').paginate(:page => params[:page])
  end
end
