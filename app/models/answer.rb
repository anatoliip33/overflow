class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :ratings
  accepts_nested_attributes_for :ratings
end
