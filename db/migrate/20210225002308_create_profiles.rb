class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.integer :leaning_histry
      t.string :purpose

      t.timestamps
    end
  end
end
