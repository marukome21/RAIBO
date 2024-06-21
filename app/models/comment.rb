class Comment < ApplicationRecord

  has_many :likes, dependent: :destroy

end
