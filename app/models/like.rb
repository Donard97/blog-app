class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, foreign_key: 'post_id'

  def update_likes_counter
    post.increment!(:likes_counter)
  end
end
