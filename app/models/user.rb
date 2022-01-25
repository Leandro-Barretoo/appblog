class User < ApplicationRecord
    has_many :posts, dependent :destroy
    has_many :comments, dependent :destroy
    has_many :likes

    def last_three(value = 3)
        posts.order('created_at').last(value)
    end
end
