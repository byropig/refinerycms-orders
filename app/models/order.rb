class Order < ActiveRecord::Base
  
  after_create :generate_reference_number
  
  acts_as_indexed :fields => [:order_number, :order_status, :address_line_1, :address_line_2, :city, :postal_code, :suburb]

  STATUSES = ['Awaiting EFT Payment', 'Awaiting Credit Card Payment', 'New', 'Processing', 'Complete', 'Cancelled', 'Stale']

  validates_inclusion_of :order_status, :in => STATUSES
  
  belongs_to :customer
  
  has_many :order_items
  
  # --- PRIVATE ---
  private

  def generate_reference_number
    self.order_number = "ORDER%04d" % id
    self.save
  end
  
  
end
