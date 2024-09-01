class PostGenre < ApplicationRecord
  has_one :post

  validates :name, presence: true

end
