class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.json :images

      t.timestamps null: false
    end
  end
end
