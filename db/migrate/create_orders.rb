class CreateOrders < ActiveRecord::Migration

  def self.up
    create_table :orders do |t|
      t.string :order_number
      t.references :customer
      t.string :order_status
      t.decimal :grand_total
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :postal_code
      t.string :suburb
      t.integer :position

      t.timestamps
    end

    add_index :orders, :id

    load(Rails.root.join('db', 'seeds', 'orders.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "orders"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/orders"})
    end

    drop_table :orders
  end

end
