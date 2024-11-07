class Post < ApplicationRecord
  has_many_attached :images

  belongs_to :user
  has_many :comments, dependent: :destroy
  belongs_to :post_genre

  validates :title, presence: true
  validates :body, presence: true

  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("title LIKE? OR body LIKE?", "#{word}", "#{word}")
    elsif search == "forward_match"
      @post = Post.where("title LIKE? OR body LIKE?", "#{word}%", "#{word}%")
    elsif search == "backward_match"
      @post = Post.where("title LIKE? OR body LIKE?", "%#{word}", "%#{word}")
    elsif search == "partial_match"
      @post = Post.where("title LIKE? OR body LIKE?", "%#{word}%", "%#{word}%")
    else
      @post = Post.all
    end
  end

  private


end
