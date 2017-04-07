class LineItemsController < ApplicationController
  before_action :authorize!
  def new
    if current_user.orders == nil
      @order = current_user.unpaid_order
    else
      @order = current_user.order.create
    end
    @line_item = @order.line_item.new
  end

  def create
    @line_item = current_user.user_order.build(line_item_params)
  end

  def edit
    @line_item = LineItem.find(params[:id])
  end

  def update
    @line_item = LineItem.find(params[:id])
    @line_item.update(line_item_params)
    @line_item.save
  end

  private

  def line_item_params
    params.require(:line_item).permit(:quantity, :product_id)
  end

  def authorize!
    unless current_user
      redirect_to products_path, notice: "Please log in before you add to your cart"
    end
  end
end
