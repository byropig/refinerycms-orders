class ToAddFieldsToOrderItem < ActiveRecord::Migration
  def self.up
    add_column :order_items, :quantity, :integer
    add_column :order_items, :total, :decimal
  end

  def self.down
    remove_column :order_items, :total
    remove_column :order_items, :quantity
  end
end
