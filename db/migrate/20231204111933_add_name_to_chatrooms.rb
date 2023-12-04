class AddNameToChatrooms < ActiveRecord::Migration[7.1]
  def change
    add_column :chatrooms, :name, :string
  end
end
