class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post, counter_cache: :commentsCounter

    def comments_updater(value)
        post.update(commentsCounter: value)
    end
end
