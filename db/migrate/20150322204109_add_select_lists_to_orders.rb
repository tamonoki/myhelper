class AddSelectListsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :selectfiles, :text
  end
end
