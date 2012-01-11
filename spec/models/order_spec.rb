require 'spec_helper'

describe Order do

  def reset_order(options = {})
    @valid_attributes = {
      :id => 1,
      :order_number => "RSpec is great for testing too"
    }

    @order.destroy! if @order
    @order = Order.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_order
  end

  context "validations" do
    
    it "rejects empty order_number" do
      Order.new(@valid_attributes.merge(:order_number => "")).should_not be_valid
    end

    it "rejects non unique order_number" do
      # as one gets created before each spec by reset_order
      Order.new(@valid_attributes).should_not be_valid
    end
    
  end

end