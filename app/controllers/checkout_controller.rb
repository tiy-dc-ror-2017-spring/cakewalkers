class CheckoutController < ApplicationController
  def address_new
    @address = Address.new
  end

  def address_create
    @address = current_user.addresses.build(address_params)

    if @address.save
      current_user.unpaid_order.update(address: @address)
      redirect_to payment_checkout_path, notice: "Address successfully created."
    else
      render :address_new
    end
  end

  def payment_new
  end

  def payment_create
    if payment_params[:credit_card]
      @order = current_user.unpaid_order
      @order.paid_at = Time.zone.now
      @order.save

      redirect_to checkout_success_path(order_id: @order.id), notice: "Payment successfully created."
    else
      render :payment_new, notice: "Please re-enter payment."
    end
  end

  def order_payment_successful
    @order = Order.find(params[:order_id])
    render :success
  end

  private

  def address_params
    params.require(:address).permit(:first_name, :last_name, :street, :city, :state, :zip)
  end

  def payment_params
    params.permit(:credit_card, :expiration, :cvv)
  end
end
