class AddDiscountToProduct < ActiveRecord::Migration
  def change
    add_column :products, :discount, :integer
  end
end
