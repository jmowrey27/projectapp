class ShoppingCart

    def initialize(token:)
        @token = token
    end

    def order 
        @order ||= Order.find_or_create_by(token: @token) do |order|
            order.sub_total = 0
        end
    end
    
    def add_item(product_id:, quantity: 1)
        product = Product.find(product_id)
      
        order_item = order.items.find_or_create_by(
          product_id: product_id
        ) do |item|
          item.price = product.price
        end
      
        order_item.quantity += quantity.to_i
        order_item.save
    end
      
    def remove_item(id:)
     order.items.destroy(id)
    end

    def items_count
        order.items.sum(:quantity)
    end
end
    