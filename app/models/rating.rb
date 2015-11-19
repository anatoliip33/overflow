class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  belongs_to :answer

  def update
    question.update({rating: Rating.where(question: question).avg(:score)})
  end
end
