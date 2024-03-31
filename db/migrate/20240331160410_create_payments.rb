class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.references :order, null: false, foreign_key: true
      t.string :card_number
      t.date :expiry_date
      t.string :cvv

      t.timestamps
    end
  end
end
