authorization do
  role :admin do
    has_permission_on [:products, :beritas], :to => [:index, :show, :new, :edit, :update, :destroy]
  end

   role :guest do
    has_permission_on :products, :to => [:index, :show]
  end

  role :pelanggan do
    includes :guest
  end

  role :penjual do
    includes :guest
    has_permission_on :products, :to => [:index, :new, :create, :edit, :update, :delete]

end

