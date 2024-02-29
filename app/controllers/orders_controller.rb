# frozen_string_literal: true

# Controller logic for orders
class OrdersController < ApplicationController
  before_action :find_order, only: %i[show edit update destroy]
  def index
    @date = params[:created_on].present? ? params[:created_on].to_date : Date.today
    @total_sales = OrderItem.given_day_sales(@date).sum(:quantity)
    order_per_day = Order.given_day_entries(@date).order(created_at: :desc)
    @average_order_amount = (order_per_day.sum(:total_amount) / @total_sales).round(2)
    @orders = order_per_day.paginate(page: params[:page], per_page: 10)
  end

  def new
    @product = Product.all
  end

  def create
    @order = Service::CreateOrder.new(params: order_items_params[:items]).call
    if @order.persisted?
      render json: @order, status: :created
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update; end

  def destroy; end

  private

  def find_order
    @order = Order.find(params[:id])
  end

  def order_items_params
    params.require(:order).permit(items: %i[id quantity])
  end
end
