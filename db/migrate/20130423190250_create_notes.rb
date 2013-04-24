class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :value
      t.references :place, index: true
      t.references :user,  index: true
      t.foreign_key :users
      t.foreign_key :places

      t.timestamps
    end
  end
end
