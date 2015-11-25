class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true
  belongs_to :user
  after_save :score

  # default_scope { order(score: :asc) }

  validates :user_id, uniqueness: { scope: [:votable_id, :votable_type] }
  validates :votable, :user, presence: true

  enum kind: [:like, :dislike]

  def score
    votable.update_attribute(:score, votable.votes.like.count - votable.votes.dislike.count)
  end

end
