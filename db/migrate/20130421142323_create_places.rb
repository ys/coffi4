class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :slug
      t.string :address
      t.string :city
      t.string :country
      t.string :fsq_id
      t.boolean :wifi, default: false
      t.float :latitude
      t.float :longitude
      t.integer :creator_id, index: true
      t.foreign_key :users, column: :creator_id

      t.timestamps
    end
  end
end
