class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, counter_cache: :likesCounter

  def like_updater(value)
    post.update(likesCounter: value)
  end
end
