class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.bigint :post_id, null: false, foreign_key: true
      t.bigint :user_id, null: false, foreign_key: true


      t.timestamps
    end
  end
end
