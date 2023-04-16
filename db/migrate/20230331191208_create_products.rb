class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.text :description
      t.decimal :price, null: false, precision: 15, scale:2
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
