class AddRoomRefToTickets < ActiveRecord::Migration[7.1]
  def change
    add_reference :tickets, :room, null: false, foreign_key: true
  end
end
