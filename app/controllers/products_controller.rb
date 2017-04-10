class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  def index
    @products = Product \
                .order(created_at: :desc)
                .page params[:page]
  end

  # GET /products/1
  def show; end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end
