class HomeController < ApplicationController
  def index
    if params[:tag]
      @questions = params[:unanswered] ? Question.unanswered.tagged_with(params[:tag]).order('created_at DESC').paginate(:page => params[:page]) : Question.tagged_with(params[:tag]).order('created_at DESC').paginate(:page => params[:page])
    else
      @questions = params[:unanswered] ? Question.unanswered.order('created_at DESC').paginate(:page => params[:page]) : Question.order('created_at DESC').paginate(:page => params[:page])
    end
  end
end
