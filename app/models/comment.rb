class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, counter_cache: :commentsCounter
  validates :author_id, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :post_id, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def comment_updater(value)
    post.update(commentsCounter: value)
  end
end
