class User < ApplicationRecord
  after_create :set_roles
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0, allow_nil: true }

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def admin?
    role == 'admin' ? true : false
  end

  private

  def set_roles
    update(role: 'user')
  end
end
