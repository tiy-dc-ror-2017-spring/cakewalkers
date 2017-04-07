class Admin::OrdersController < ApplicationController
  def index
    @page = (params[:page] || 1).to_i
    if @page.negative? || @page == 0
      @page = 1
    end

    @per_page = (params[:per_page] || 100).to_i
    @total_pages = (Order.count.to_f / @per_page).ceil
    @total_pages = @total_pages > 0 ? @total_pages : 1

    if @page > @total_pages
      @page = @total_pages
    end

    @orders = Order.order(created_at: :desc).limit(@per_page).offset(@per_page * (@page - 1) )
  end

  def show
  end
end
