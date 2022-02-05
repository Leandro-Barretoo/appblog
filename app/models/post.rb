class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes
  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :commentsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def posts_updater(value)
    user.update(postCounter: value)
  end

  def last_five(value = 5)
    comments.last(value)
  end
end
