class OrderProxy
    def initialize(session)
        @session = session
        @session[:order_token] = SecureRandom.urlsafe_base64(nil, false) 
        @session[:order_token] = {}
    end
    def product=(product)
        @product = product
        @session[:order_token][:product] = @product.id
    end
    def user=(user)
        @user = user
        @session[:order_token][:user] = @user.id
    end

    def checkout
        order = Order.new
        order.product = @product
        order.user = @user
        order.save
    end
end