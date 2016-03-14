class CreateSearchIndices < ActiveRecord::Migration
  def change
    create_table :search_indices do |t|
      t.string :word
      t.belongs_to :product, index: true
    end
  end
end
