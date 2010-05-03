authorization do
  
  role :admin do
    has_permission_on [:products, :beritas, :users], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    
  end

   role :guest do
    has_permission_on [:products, :beritas], :to => [:index, :show]
  end

  role :pelanggan do
    includes :guest
    has_permission_on [:user], :to => [:edit, :update] do
      if_attribute :user => is { user }
    end
  end

  role :penjual do
    has_permission_on [:user], :to => [:edit, :update] do
      if_attribute :user => is { user }
    end
    has_permission_on [:beritas], :to => [:index, :show]
    has_permission_on [:products], :to => [:index, :show, :new, :create]
    has_permission_on [:products], :to => [:edit, :update, :destroy] do
      if_attribute :user => is { user }
    end
  end
  

end

