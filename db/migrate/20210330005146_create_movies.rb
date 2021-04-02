class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.text :introduction, null: false
      t.references :user, foreign_key:true, null:false
 
      t.timestamps
    end
  end
end
