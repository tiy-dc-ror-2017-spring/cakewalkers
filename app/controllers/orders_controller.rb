class OrdersController < ApplicationController
  def index
    @orders = current_user.orders.order(created_at: :desc)
    @orders = @orders.each do |order| 
      order.finalize
    end
  end

  def show
    @order = Order.find(params[:id])
    @user = current_user
    @line_items = @order.line_items
  end
end
