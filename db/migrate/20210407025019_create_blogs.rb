class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :body
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
