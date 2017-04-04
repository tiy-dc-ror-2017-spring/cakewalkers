class OrdersController < ApplicationController
  def create
    @client = current_user
    @line_items = @client.order.last.line_items
    @subtotal = @line_items.calculate_subtotal
    @tax = line_items.tax
    @total = @subtotal + @tax
    @order = @client.order.build(subtotal: @subtotal, tax: @tax, total: @total)
  end
end
