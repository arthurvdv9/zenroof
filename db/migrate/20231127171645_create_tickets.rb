class CreateTickets < ActiveRecord::Migration[7.1]
  def change
    create_table :tickets do |t|
      t.string :title
      t.string :description
      t.string :status
      t.string :priority

      t.timestamps
    end
  end
end
