class Post < ApplicationRecord
  has_many_attached :images

  FILE_NUMBER_LIMIT = 3

  validate :validate_number_of_files

  belongs_to :user
  has_many :comments
  belongs_to :post_genres

  validates :title, presence: true
  validates :body, presence: true
  validates :post_genres_id, presence: true

  private

  def validate_number_of_files
  return if images.length <= FILE_NUMBER_LIMIT
  errors.add(:images,"に添付できる画像は#{FILE_NUMBER_LIMIT}件までです。")
  end

end
