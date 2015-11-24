class Question < ActiveRecord::Base
  belongs_to :user
  has_many :votes, as: :votable, dependent: :destroy
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true

  validates :user, :header, :description, presence: true

  is_impressionable :column_name => :review, :unique => :request_hash, :counter_cache => true
  self.per_page = 5

  scope :unanswered, lambda { joins('LEFT OUTER JOIN answers ON questions.id = answers.question_id').where('answers.question_id IS NULL') }
end
