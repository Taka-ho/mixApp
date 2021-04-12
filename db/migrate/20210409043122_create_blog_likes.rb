class CreateBlogLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :blog_likes do |t|
      t.bigint :blog_id, null: false, foreign_key: true
      t.bigint :user_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
