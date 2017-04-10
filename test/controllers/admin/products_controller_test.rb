require "test_helper"

class Admin::ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
    login_admin
  end

  test "should create product" do
    assert_difference("Product.count") do
      post admin_products_url, params: { product: { description: @product.description, name: @product.name, picture: @product.picture, unit_price_in_cents: @product.unit_price_in_cents } }
    end
    assert_redirected_to admin_products_url
  end

  test "should get edit" do
    get edit_admin_product_url(@product)
    assert_response :success
  end

  test "should destroy product" do
    assert_difference("Product.count", -1) do
      delete admin_product_url(@product)
    end
  end
end
