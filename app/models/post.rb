class Post < ApplicationRecord



  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_one_attached :image


  validates :post_text, presence: true



# 検索方法分岐
  def self.looks(search, word)
    @post = Post.where("post_text LIKE?","%#{word}%")
  end



  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end

end
