class Admin::OrdersController < ApplicationController
  def index
    @page = (params[:page] || 1).to_i

    # If an invalid page number, go to the first page.
    @page = @page <= 0 ? 1 : @page
    @per_page = (params[:per_page] || 100).to_i

    @total_pages = (Order.count.to_f / @per_page).ceil
    # If there are no pages there is always 1 page.
    @total_pages = @total_pages > 0 ? @total_pages : 1

    # If a request page is greater than max, default to last page.
    @page = @page > @total_pages ? @total_pages : @page

    @orders = Order \
              .order(created_at: :desc)
              .limit(@per_page)
              .offset(@per_page * (@page - 1))
  end

  def show; end
end
