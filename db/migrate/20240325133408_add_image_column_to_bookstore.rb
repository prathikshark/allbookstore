class AddImageColumnToBookstore < ActiveRecord::Migration[6.1]
  def change
    add_column :bookstores, :image, :string
  end
end
