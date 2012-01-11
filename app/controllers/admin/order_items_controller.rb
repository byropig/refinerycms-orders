module Admin
  class OrderItemsController < Admin::BaseController

    crudify :order_item,
            :title_attribute => 'product_name', :xhr_paging => true

  end
end
