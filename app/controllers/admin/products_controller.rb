class Admin::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @page = (params[:page] || 1).to_i
    @page = @page <= 0 ? 1 : @page

    @per_page = 20

    @total_pages = (Product.count.to_f / @per_page).ceil
    @total_pages = @total_pages > 0 ? @total_pages : 1

    @products = Product \
                .order(created_at: :desc)
                .limit(@per_page)
                .offset(@per_page * (@page - 1))
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to admin_products_path, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path, notice: 'Product was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:name, :description, :picture, :unit_price_in_cents)
    end
end
