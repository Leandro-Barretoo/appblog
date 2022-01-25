class Like < ApplicationRecord
    belongs_to :user
    belongs_to :post

    def like_updater(value)
        post.update(likesCounter: value)
    end
end
