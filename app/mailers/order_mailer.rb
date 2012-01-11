class OrderMailer < ActionMailer::Base

  def admin_new_order(customer, order)
    subject     "New Cash Order Received"
    recipients  RefinerySetting[:order_notification_recipients]
    from        "<no-reply@redontop.co.za>"    
    @customer =  customer
    @order = order
    
    mail(:to => recipients,
        :subject => subject,
        :from => from)
  end
  
  def admin_credit_received(customer, order)
    subject     "Credit Card Payment for Order Approved"
    recipients  RefinerySetting[:order_notification_recipients]
    from        "<no-reply@redontop.co.za>"    
    @customer =  customer
    @order = order
    
    mail(:to => recipients,
        :subject => subject,
        :from => from)
  end
  
  def customer_new_order(customer, order)
    subject     "New Cash Order"
    recipients  customer.email
    from        "<no-reply@redontop.co.za>"    
    @customer =  customer
    @order = order
    
    mail(:to => recipients,
        :subject => subject,
        :from => from)
  end

  def customer_new_credit_order(customer, order)
    subject     "New Credit Card Order"
    recipients  customer.email
    from        "<no-reply@redontop.co.za>"    
    @customer =  customer
    @order = order
    
    mail(:to => recipients,
        :subject => subject,
        :from => from)
  end
  
  def customer_cash_received(customer, order)
    subject     "Payment for Order Received"
    recipients  customer.email
    from        "<no-reply@redontop.co.za>"    
    @customer =  customer
    @order = order
    
    mail(:to => recipients,
        :subject => subject,
        :from => from)
    
  end
  
end