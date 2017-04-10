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
  end


  private def address_params
    params.require(:address).permit(:first_name, :last_name, :street, :city, :state, :zip)
  end
end
