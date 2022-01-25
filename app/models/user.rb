class User < ApplicationRecord
  has_many :posts, dependent: :destroy, foreign_key: 'author_id'
  has_many :comments, dependent: :destroy, foreign_key: 'author_id'
  has_many :likes, dependent: :destroy, foreign_key: 'author_id'

  def last_three(value = 3)
    posts.order('created_at').last(value)
  end
end
