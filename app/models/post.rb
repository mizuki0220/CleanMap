class Post < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  has_many :comments
  belongs_to :post_genres

  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true
  validates :post_genres_id, presence: true

end
