class OrdersController < ApplicationController

  def index
    @orders = current_user.orders.order(created_at: :desc)
  end

  def create
    @client = current_user
    @order = @client.order.last
    @line_items = @order.line_items
    @subtotal = @order.calculate_subtotal(@line_items)
    @tax_total = @order.calculate_tax_total(@subtotal)
    @total = @subtotal + @tax_total
    @order.update(subtotal: @subtotal, tax: @tax_total, total: @total)
  end

  def show
    @order = Order.find(params[:id])
    @user = current_user
    @line_items = @order.line_items
  end
end
