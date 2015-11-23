class Question < ActiveRecord::Base
  belongs_to :user
  has_many :ratings
  has_many :answers
  accepts_nested_attributes_for :answers, allow_destroy: true
  acts_as_votable

  is_impressionable :column_name => :review, :unique => :request_hash, :counter_cache => true
  self.per_page = 5

  scope :unanswered, lambda { joins('LEFT OUTER JOIN answers ON questions.id = answers.question_id').where('answers.question_id IS NULL') }
end
