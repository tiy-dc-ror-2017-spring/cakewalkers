class Admin::OrdersController < Admin::BaseController
  before_action :staff_authorize!
  def index
    @orders = Order \
              .order(created_at: :desc)
              .page params[:page]
  end

  def show
    @order = Order.find(params[:id])
  end

  def ready
    @orders = Order.ready.page params[:page]
    render :index
  end

  def claim
    @order = Order.find(params[:id])
    @order.picked_up_at = Time.zone.now
    @order.staff_member = current_user.staff_member
    @order.save
    redirect_to admin_order_path(@order)
  end
end
