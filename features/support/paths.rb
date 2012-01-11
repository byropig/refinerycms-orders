module NavigationHelpers
  module Refinery
    module Orders
      def path_to(page_name)
        case page_name
        when /the list of orders/
          admin_orders_path

         when /the new order form/
          new_admin_order_path
        when /the list of order_items/
          admin_order_items_path

         when /the new order_item form/
          new_admin_order_item_path
        else
          nil
        end
      end
    end
  end
end
