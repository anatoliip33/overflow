class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!

  before_action :set_question


  def new
    @answer = Answer.new
  end

  def edit
  end


  def create
    @answer = Answer.new(answer_params)

      if @answer.save
        redirect_to question_path(@question)
      else
        redirect_to question_path(@question), alert: 'Comment can\'t be created'
      end
  end



  private

    def set_answer
      @answer = Answer.find(params[:id])
    end
    def set_question
      @question = Question.find(params[:question_id])
    end

    def answer_params
      params.require(:answer).permit(:body).merge(question: @question, user: current_user)
    end
end
