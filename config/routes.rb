::Refinery::Application.routes.draw do
  resources :orders, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    
    resources :orders do   
      match "update_awaiting_eft" => "orders#update_awaiting_eft", :as => "update_awaiting_eft"
      match "update_awaiting_cc" => "orders#update_awaiting_cc", :as => "update_awaiting_cc"
      match "update_new" => "orders#update_new", :as => "update_new"
      match "update_processing" => "orders#update_processing", :as => "update_processing"
      match "update_complete" => "orders#update_complete", :as => "update_complete"
      match "update_cancelled" => "orders#update_cancelled", :as => "update_cancelled"
      match "update_stale" => "orders#update_stale", :as => "update_stale"
      collection do
        get :notification_recipients
        post :notification_recipients
        
        post :update_positions         
        
      end
    end
  end
  
  resources :order_items, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :order_items, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
