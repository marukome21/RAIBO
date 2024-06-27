class Like < ApplicationRecord

  belongs_to :user
  belongs_to :post, optional: true        #コメントIDが空でも機能する設定
  belongs_to :comment, optional: true     #ポストIDが空でも機能する設定

  validates :user_id, uniqueness: {scope: :post_id}
end
