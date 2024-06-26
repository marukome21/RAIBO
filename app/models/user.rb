class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :followings, class_name: "Following", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_followings, class_name: "Following", foreign_key: "followee_id", dependent: :destroy
  has_many :relationships, through: :followings, source: :followee
  has_many :followers, through: :reverse_of_followings, source: :follower

  validates :user_name, presence: true, uniqueness: true, length: { minimum: 1, maximum: 50 }
  validates :email, presence: true, uniqueness: true
  validates :profile, length: { maximum: 160 }

  has_one_attached :user_image


  # フォローしたときの処理
  def follow(user_id)
    followings.create(followee_id: user_id)
  end
# フォローを外すときの処理
  def unfollow(user_id)
    followings.find_by(followee_id: user_id).destroy
  end
# フォローしているか判定
  def following?(user)
    followings.exists?(followee_id: user.id)
  end

  # 検索方法分岐
  def self.looks(search, word)
      @user = User.where("user_name LIKE?","%#{word}%")
  end

  def get_user_image(width, height)
    unless user_image.attached?
      file_path = Rails.root.join('app/assets/images/images.jpg')
      user_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    user_image.variant(resize_to_limit: [width, height]).processed
  end

  def active_for_authentication?
    super && (is_active == true)
  end

  def self.guest
    find_or_create_by!(user_name: 'guestuser' ,email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.user_name = "guestuser"
    end
  end

end