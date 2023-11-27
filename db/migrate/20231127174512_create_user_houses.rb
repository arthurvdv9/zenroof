class CreateUserHouses < ActiveRecord::Migration[7.1]
  def change
    create_table :user_houses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :house, null: false, foreign_key: true

      t.timestamps
    end
  end
end
