class AddPriceToPurchasers < ActiveRecord::Migration[6.0]
  def change
    add_column :purchasers, :price, :integer
  end
end
