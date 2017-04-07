class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  def index
    @page = (params[:page] || 1).to_i
    @page = @page <= 0 ? 1 : @page

    @per_page = 20

    @total_pages = (Product.count.to_f / @per_page).ceil
    @total_pages = @total_pages > 0 ? @total_pages : 1

    @page = @page > @total_pages ? @total_pages : @page

    @products = Product \
                .order(created_at: :desc)
                .limit(@per_page)
                .offset(@per_page * (@page - 1))
  end

  # GET /products/1
  def show
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end
