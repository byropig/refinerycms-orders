class OrderItem < ActiveRecord::Base

  

  validates_presence_of :order_id, :product_name, :price
  validates_numericality_of :price
  
  belongs_to :order
  
end
