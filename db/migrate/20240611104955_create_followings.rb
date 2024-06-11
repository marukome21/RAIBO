class CreateFollowings < ActiveRecord::Migration[6.1]
  def change
    create_table :followings do |t|
      t.string :follower_id
      t.string :followee_id
      t.timestamps
    end
  end
end
