class RatingsController < ApplicationController
  layout false
  # before_action :set_rating

  def rating
    @rating.score = params[:score]
    @rating.save
  end

  # def create
  #   @rating = Rating.new(rating_params)

  #   respond_to do |format|
  #     if @rating.save
  #       format.html { redirect_to :back, notice: 'Rating was successfully created.' }
  #     end
  #   end
  # end

  # def update
  #   respond_to do |format|
  #     if @rating.update(rating_params)
  #       format.html { redirect_to :back, notice: 'Rating was successfully updated.' }
  #     end
  #   end
  # end

  private

    def set_rating
      @rating = Rating.find(params[:id])
    end

    # def rating_params
    #   params.require(:rating).permit(:score, :question_id, :answer_id).merge(user: current_user)
    # end
end
