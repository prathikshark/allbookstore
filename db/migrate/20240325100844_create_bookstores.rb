class CreateBookstores < ActiveRecord::Migration[6.1]
  def change
    create_table :bookstores do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.string :email

      t.timestamps
    end
  end
end
