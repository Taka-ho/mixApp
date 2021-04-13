class AddBlogIdToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :blog, foreign_key: true, null: false
  end
end
