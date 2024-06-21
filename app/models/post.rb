class Post < ApplicationRecord



  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_one_attached :image


  validates :post_text, presence: true

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end

end
