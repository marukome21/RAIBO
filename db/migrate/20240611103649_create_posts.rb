class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.string :user_id
      t.text :post_text
      t.timestamps
    end
  end
end
