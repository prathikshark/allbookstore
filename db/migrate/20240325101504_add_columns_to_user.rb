class AddColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :phone, :string
    add_column :users, :address, :string
  end
end
