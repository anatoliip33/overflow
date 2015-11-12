class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  accepts_nested_attributes_for :answers, allow_destroy: true

  is_impressionable :column_name => :review, :unique => :request_hash, :counter_cache => true
  self.per_page = 10
end
