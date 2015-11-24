class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true
  belongs_to :user

  validates :user_id, uniqueness: { scope: [:votable_id, :votable_type] }
  validates :votable, :user, presence: true

  enum kind: [:like, :dislike]

end
