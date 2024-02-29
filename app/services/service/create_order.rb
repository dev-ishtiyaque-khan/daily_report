# frozen_string_literal: true

# Service logic for Order
module Service
  # Create a new Order
  class CreateOrder
    attr_reader :user, :params, :product_ids
    attr_accessor :order_attributes

    def initialize(params:)
      @params = params
      @user = User.find_by(email: 'akpatel@deqode.com')
      @order_attributes = { total_amount: 0, order_items_attributes: [] }
      @product_ids = []
    end

    def call
      order = user.orders.build
      build_order_attributes
      order.assign_attributes(order_attributes)
      order.fullfiller_id = fullfiller_id
      order.save if order.valid?
      order
    end

    private

    def build_order_attributes
      params.each do |item|
        id, quantity = item.values
        product = Product.find(id)
        item = { price: product.price, quantity: quantity, product_id: product.id }
        order_attributes[:order_items_attributes].push(item)
        order_attributes[:total_amount] += item[:price] * quantity
        product_ids.push(product.id)
      end
    end

    def fullfiller_id
      distributer = DistributionCenter.find_fullfiller_for_given_product(product_ids).sample
      return distributer.id if distributer

      FullfillmentCenter.all.sample&.id
    end
  end
end
