class LineItemsController < ApplicationController
  before_action :authorize!
  def new
    if user_last_order.paid == true
      @order = current_user.order.create
      @line_item = @order.new
    else
      @line_item = user_last_order.line_item.new
    end
  end

  def create
    @line_item = user_last_order.line_item.build(line_item_params)
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

  def user_last_order
    if current_user.order
      current_user.order.last
    end
  end

  def authorize!
    if !current_user.client
      session[:error] = "Go Away"
      redirect_to products_path
    end
  end
end
