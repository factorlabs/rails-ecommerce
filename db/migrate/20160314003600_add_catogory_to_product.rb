class AddCatogoryToProduct < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.belongs_to :category, index: true
    end
  end
end
