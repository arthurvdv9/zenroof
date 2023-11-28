class AddNumberToRooms < ActiveRecord::Migration[7.1]
  def change
    add_column :rooms, :number, :integer
  end
end
