class StockCodeAddedToOrderItem < ActiveRecord::Migration
  def self.up
		add_column :order_items, :stock_code, :string
  end

  def self.down
		remove_column :order_items, :stock_code
  end
end
