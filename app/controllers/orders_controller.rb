class OrdersController < ApplicationController

  before_filter :find_all_orders
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @order in the line below:
    present(@page)
  end

  def show
    @order = Order.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @order in the line below:
    present(@page)
  end

protected

  def find_all_orders
    @orders = Order.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/orders").first
  end

end
