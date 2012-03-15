class OrderMailer < ActionMailer::Base

  def admin_new_order(customer, order)
    subject     "New Cash Order Received"
    recipients  RefinerySetting.find_or_set(:order_notification_recipients, "byron@perfectcircle.co.za, james@perfectcircle.co.za")
    from        RefinerySetting.find_or_set(:order_notification_from, "<no-reply@example.com>")    
    @customer =  customer
    @order = order
    
    mail(:to => recipients,
        :subject => subject,
        :from => from)
  end
  
  def admin_credit_received(customer, order)
    subject     "Credit Card Payment for Order Approved"
    recipients  RefinerySetting.find_or_set(:order_notification_recipients, "byron@perfectcircle.co.za, james@perfectcircle.co.za")
    from        RefinerySetting.find_or_set(:order_notification_from, "<no-reply@example.com>")   
    @customer =  customer
    @order = order
    
    mail(:to => recipients,
        :subject => subject,
        :from => from)
  end
  
  def customer_new_order(customer, order)
    subject     "New Cash Order"
    recipients  customer.email
    from        RefinerySetting.find_or_set(:order_notification_from, "<no-reply@example.com>")
    @customer =  customer
    @order = order
    
    mail(:to => recipients,
        :subject => subject,
        :from => from)
  end

  def customer_new_credit_order(customer, order)
    subject     "New Credit Card Order"
    recipients  customer.email
    from        RefinerySetting.find_or_set(:order_notification_from, "<no-reply@example.com>")
    @customer =  customer
    @order = order
    
    mail(:to => recipients,
        :subject => subject,
        :from => from)
  end
  
  def customer_cash_received(customer, order)
    subject     "Payment for Order Received"
    recipients  customer.email
    from        RefinerySetting.find_or_set(:order_notification_from, "<no-reply@example.com>")
    @customer =  customer
    @order = order
    
    mail(:to => recipients,
        :subject => subject,
        :from => from)
    
  end
  
end
