class CreateOrderItems < ActiveRecord::Migration

  def self.up
    create_table :order_items do |t|
      t.string :product_name
      t.decimal :price
      t.integer :order_id
      t.integer :position

      t.timestamps
    end

    add_index :order_items, :id

    load(Rails.root.join('db', 'seeds', 'order_items.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "order_items"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/order_items"})
    end

    drop_table :order_items
  end

end
