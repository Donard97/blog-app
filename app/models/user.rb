class User < ApplicationRecord
  has.many :posts, foreign_key: 'author_id'
  has.many :comments, foreign_key: 'author_id'
  has.many :likes, foreign_key: 'author_id'

  def recent_posts
    posts.last(3)
  end
end
