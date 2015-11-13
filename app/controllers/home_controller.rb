class HomeController < ApplicationController
  def index
    @questions = params[:unanswered] ? Question.unanswered.order('created_at DESC').paginate(:page => params[:page]) : Question.order('created_at DESC').paginate(:page => params[:page])
  end
end
