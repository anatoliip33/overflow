class RatingsController < ApplicationController
  # before_action :set_rating, only: [:show, :update]

  def vote_up
    @question = Question.find(params[:id])
    @rating = @question.ratings.create(user_id: current_user.id, polarity: 1)
  end

  def vote_down
    @question = Question.find(params[:id])
    @rating = @question.ratings.create(user_id: current_user.id, polarity: -1)
  end

  # private

  #   def set_rating
  #     @rating = Rating.find(params[:id])
  #   end

  #   def rating_params
  #     params.require(:rating).permit(:score, :question_id, :answer_id).merge(user: current_user)
  #   end
end
