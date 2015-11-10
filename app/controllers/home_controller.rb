class HomeController < ApplicationController
  def index
    @questions = Question.order('created_at ASC').paginate(:page => params[:page])
  end
end
