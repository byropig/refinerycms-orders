class OrderItemsController < ApplicationController

  before_filter :find_all_order_items
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @order_item in the line below:
    present(@page)
  end

  def show
    @order_item = OrderItem.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @order_item in the line below:
    present(@page)
  end

protected

  def find_all_order_items
    @order_items = OrderItem.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/order_items").first
  end

end
