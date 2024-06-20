class Post < ApplicationRecord

  has_one_attached :image
  belongs_to :user
  validates :post_text, presence: true

end
