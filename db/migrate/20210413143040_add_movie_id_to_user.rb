class AddMovieIdToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :movie, foreign_key: true, null: false
  end
end
