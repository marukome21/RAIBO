class Comment < ApplicationRecord

  has_many :likes, dependent: :destroy
  belongs_to :user
  belongs_to :post

  validates :comment_text, presence: true, length: { maximum: 65 }

end
