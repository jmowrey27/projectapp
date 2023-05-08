class AddIndexToOrderIdInOrderItems < ActiveRecord::Migration[7.0]
  def change
    add_index :order_items, :product_id, name: 'index_order_items_on_product_id'
  end
end
