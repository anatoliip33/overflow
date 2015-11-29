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
    # @question = Question.find(params[:question_id])
    # @answer = @question.answers.create(params[:answer])

    respond_to do |format|
      if @answer.save
        format.html { redirect_to question_path(@question) }
        format.js
      else
        redirect_to question_path(@question), alert: 'Comment can\'t be created'
      end
    end
  end

  # def update
  #   respond_to do |format|
  #     if @answer.update(answer_params)
  #       format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @answer }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @answer.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end



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
