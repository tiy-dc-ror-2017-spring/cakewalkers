class OrdersController < ApplicationController
  def create
    @client = current_user
    @order = @client.order.last
    @line_items = @order.line_items
    @subtotal = @order.calculate_subtotal(@line_items)
    @tax_total = @order.calculate_tax_total(@subtotal)
    @total = @subtotal + @tax_total
    @order.update(subtotal: @subtotal, tax: @tax_total, total: @total)
  end
end
