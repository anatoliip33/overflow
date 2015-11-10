class Question < ActiveRecord::Base
  is_impressionable :column_name => :review, :unique => :request_hash, :counter_cache => true
  self.per_page = 10
end
