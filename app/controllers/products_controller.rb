# frozen_string_literal: true

# Controller logic for products
class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @fullfiller_names = if @product.fullfillers.exists?
                          @product.fullfillers.pluck(:name)
                        else
                          FullfillmentCenter.all.pluck(:name)
                        end
  end
end
