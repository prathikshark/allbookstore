class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.integer :book_id
      t.string :book_name
      t.integer :quantity
      t.integer :price
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
