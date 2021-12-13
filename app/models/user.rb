class User < ApplicationRecord
  has.many :posts, foreign_key: 'author_id'
  has.many :comments, foreign_key: 'author_id'
  has.many :likes, foreign_key: 'author_id'

  def recent_posts
    posts.limit(3).order(created_at: :desc)
  end
end
