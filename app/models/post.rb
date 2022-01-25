class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes

  def posts_updater(value)
    user.update(postCounter: value)
  end

  def last_five(value = 5)
    comments.last(value)
  end
end
