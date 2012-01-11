require 'spec_helper'

describe OrderItem do

  def reset_order_item(options = {})
    @valid_attributes = {
      :id => 1,
      :product_name => "RSpec is great for testing too"
    }

    @order_item.destroy! if @order_item
    @order_item = OrderItem.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_order_item
  end

  context "validations" do
    
    it "rejects empty product_name" do
      OrderItem.new(@valid_attributes.merge(:product_name => "")).should_not be_valid
    end

    it "rejects non unique product_name" do
      # as one gets created before each spec by reset_order_item
      OrderItem.new(@valid_attributes).should_not be_valid
    end
    
  end

end