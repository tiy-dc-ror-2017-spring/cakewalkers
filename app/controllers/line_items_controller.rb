class LineItemsController < ApplicationController

  def new
    if current_user_last_order.paid == true
      @order = current_user.order.create
      @line_item = @order.new
    else
      @line_item = current_user_last_order.line_item.new
    end
  end

  def create
    @line_item = current_user_last_order.line_item.build(line_item_params)
  end

  private def line_item_params
    params.require(:line_item).permit(:quantity, :product_id)
  end

  private def current_user_last_order
    current_user.orders.last
  end
end
