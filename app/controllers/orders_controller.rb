class OrdersController < ApplicationController
  def create
    @client = current_user
    @order = @client.order.last
    @line_items = @order.line_items
    @subtotal = @order.calculate_subtotal(@line_items)
    @tax = @order.tax(@subtotal)
    @total = @subtotal + @tax
    @order.update(subtotal: @subtotal, tax: @tax, total: @total)
  end
end
