class CreatePasswords < ActiveRecord::Migration
  def change
    create_table :passwords do |t|
      t.references :place, index: true
      t.string :value

      t.timestamps
    end
  end
end
