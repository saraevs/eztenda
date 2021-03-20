class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :address, :string
    add_column :users, :phone_number, :string
    add_column :users, :is_venue, :boolean
    add_column :users, :name, :string
  end
end
