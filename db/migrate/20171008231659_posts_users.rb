class PostsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :posts_users, :id => false do |t|
      t.integer :post_id, null: false
      t.integer :user_id, null: false
      t.string :tweet_id, null: false
    end
  end
end
