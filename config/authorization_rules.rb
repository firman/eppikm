authorization do
  role :admin do
    has_permission_on [:products], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
  end

   role :guest do
    has_permission_on [:products], :to => [:index, :show]
  end

  role :pelanggan do
    has_permission_on [:products], :to => [:index, :show]
  end

  role :penjual do
    includes :guest
    has_permission_on [:products], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
  end
  

end

