class CreateMovieComments < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_comments do |t|
      t.string :movie_comment, null: false
      t.references :user, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
