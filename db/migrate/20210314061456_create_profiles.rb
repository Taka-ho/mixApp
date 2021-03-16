  
class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.integer :mania_histry
      t.string :enjoy_point
      
      t.timestamps
    end
  end
end