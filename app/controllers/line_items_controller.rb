class LineItemsController < ApplicationController
  before_action :authorize!
  def new
    @order = current_user.unpaid_order
    @line_item = @order.line_items.new
    @product = Product.find(params[:product])
  end

  def create
    @line_item = current_user.add_to_cart(line_item_params)
    @line_item.total_price
    redirect_to products_path
  end

  def edit
    @line_item = LineItem.find(params[:id])
  end

  def update
    @line_item = LineItem.find(params[:id])
    @line_item.update(line_item_params)
    @line_item.save
    redirect_to orders_path
  end


  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to orders_path
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
