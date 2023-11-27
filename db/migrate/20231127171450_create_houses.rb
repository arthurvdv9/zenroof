class CreateHouses < ActiveRecord::Migration[7.1]
  def change
    create_table :houses do |t|
      t.string :address
      t.string :name
      t.integer :capacity

      t.timestamps
    end
  end
end
