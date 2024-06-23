class Post < ApplicationRecord



  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_one_attached :image


  validates :post_text, presence: true



# 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("post_text LIKE?","#{word}")
    elsif search == "forward_match"
      @post = Post.where("post_text LIKE?","#{word}%")
    elsif search == "backward_match"
      @post = Post.where("post_text LIKE?","%#{word}")
    elsif search == "partial_match"
      @post = Post.where("post_text LIKE?","%#{word}%")
    else
      @post = Post.all
    end
  end



  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end

end
