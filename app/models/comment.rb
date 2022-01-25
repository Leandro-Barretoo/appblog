class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post

    def comments_updater(value)
        post.update(commentsCounter: value)
    end
end
