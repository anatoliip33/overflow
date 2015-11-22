class Rating < ActiveRecord::Base
  belongs_to :user

  enum score: [:like, :dislike]

end
