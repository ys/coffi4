class CreatePasswords < ActiveRecord::Migration
  def change
    create_table :passwords do |t|
      t.references :place, index: true
      t.references :user,  index: true
      t.foreign_key :users
      t.foreign_key :places
      t.string :value

      t.timestamps
    end
  end
end
