# d0018e bugs 

current bugs *found* in the d0018e project

** carts **
  - carts_helper
    -  line 3 `cart.exists?(id: session[:cart_id])` ==> `cart.exists?(session[:cart_id]`
    -  line 9 `order("created at, desc")`           ==> `order(created_at: :desc)` 
  - /carts/id
    -  add total price
  - /carts/
    -  shows all carts, not only current customers
  -  claims carts from previously logged in users? maybe drop this functionality

** profil **
  - `se` tidigare beställningar
    -  goes to `/orders.3` should be something like `customer/orders/`
    -  only shows deliveries if admin.
  - `välj` kundkorg
    -  lists all carts
    -  does not allow to load cart
  - `ändra` användarinformation
    - lets `permission=1`-user change permission level on him self.
    - double messages on success

** ratings **
  - on update success
    -  double message on update success
    -  `back` sends user to all comments rather than back.
  - on new fail
    -  lets user post as any user

** registration **
  -  `sessions_helper` tries to check permission on non logged in users. add check for logged_in?

** menu **
  -  side menu should change depending on user role
  -  should collapse into hamburger menu

** responsive design **
  -  `fix/mobile_design` still not merged
