class Question < ActiveRecord::Base
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :votes, as: :votable, dependent: :destroy
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true

  validates :user, :header, :description, presence: true

  is_impressionable :column_name => :review, :unique => :request_hash, :counter_cache => true
  self.per_page = 5

  scope :unanswered, lambda { joins('LEFT OUTER JOIN answers ON questions.id = answers.question_id').where('answers.question_id IS NULL') }

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).questions
  end

end
