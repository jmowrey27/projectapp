class ChangeLastNameInOrders < ActiveRecord::Migration[7.0]
  def change
    change_column_null :orders, :last_name, true
  end
end
