module Admin
  class OrdersController < Admin::BaseController

    crudify :order,
            :title_attribute => 'order_number', :xhr_paging => true

    def show
      @order = Order.find(params[:id])
    end
    
    def index
      if params[:order_status].present?
        @orders = Order.where(:order_status => params[:order_status]).paginate(:page => params[:page])
      else
        @orders = Order.paginate(:page => params[:page])
      end
    end
    
    def notification_recipients
      
      @recipients = RefinerySetting.find_or_set(:order_notification_recipients,
                                  ((Role[:refinery].users.first.email rescue nil) if defined?(Role)).to_s)
    
      if request.post?
        
        flash[:notice] = "The notification recipients have successfully been updated"
        unless request.xhr? or from_dialog?
          redirect_back_or_default(admin_orders_path)
        else
          render :text => "<script type='text/javascript'>parent.window.location = '#{admin_orders_path}';</script>",
                 :layout => false
        end
      end
    end
    
    def update_awaiting_eft
      update_status("Awaiting EFT Payment")
      
    end
    
    def update_awaiting_cc
      update_status("Awaiting Credit Card Payment")
      
    end
    
    def update_new  
      order = Order.find(params[:order_id])
          
      if params[:payment_type] == "Cash"
        OrderMailer.customer_cash_received(order.customer, order).deliver
      elsif params[:payment_type] == "Credit Card"
        OrderMailer.admin_credit_received(order.customer, order).deliver
      end
      
      update_status("New")
    end
    
    def update_processing
      update_status("Processing")
            
    end
    
    def update_complete
      update_status("Complete")
     
    end
    
    def update_cancelled
      update_status("Cancelled")
      
    end
    
    def update_stale
      update_status("Stale")
      
    end
    
    private
    
    def update_status(status)
      order = Order.find(params[:order_id])
      order.order_status = status
      order.save!
      
      redirect_to admin_order_path(order)
    end  
    
  end  
end
