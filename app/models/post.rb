class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', counter_cashe :posts_count
  has_many :comments, dependent :destroy
  has_many :likes, dependent :detroy
end
