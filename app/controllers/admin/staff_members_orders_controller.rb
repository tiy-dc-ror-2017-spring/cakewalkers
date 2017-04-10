class Admin::StaffMembersOrdersController < ApplicationController

  def index
    @orders = Order.where(staff_member: current_user.staff_member).page(params[:page])
    render "admin/orders/index"
  end
end
