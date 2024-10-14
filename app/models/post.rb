class Post < ApplicationRecord
  has_many_attached :images

  FILE_NUMBER_LIMIT = 3

  validate :validate_number_of_files

  belongs_to :user
  has_many :comments, dependent: :destroy
  belongs_to :post_genre

  validates :title, presence: true
  validates :body, presence: true
  # validates :post_genre_id, presence: true

  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @post = Post.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @post = Post.where("title LIKE?","#{word}%")
    elsif search == "partial_match"
      @post = Post.where("title LIKE?","#{word}%")
    else
      @post = Post.all
    end
  end

  # def self.looks(search, word)
  #   if search == "perfect_match"
  #     @post = Post.where("body LIKE?","#{word}")
  #   elsif search == "forward_match"
  #     @post = Post.where("body LIKE?","#{word}%")
  #   elsif search == "backward_match"
  #     @post = Post.where("body LIKE?","#{word}%")
  #   elsif search == "partial_match"
  #     @post = Post.where("body LIKE?","#{word}%")
  #   else
  #     @post = Post.all
  #   end
  # end


  private

  def validate_number_of_files
  return if images.length <= FILE_NUMBER_LIMIT
  errors.add(:images,"に添付できる画像は#{FILE_NUMBER_LIMIT}件までです。")
  end

end
