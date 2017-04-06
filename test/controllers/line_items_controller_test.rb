require 'test_helper'

class LineItemsController < ActionDispatch::IntegrationTest
  test "can be created" do
    order = Order.create!()
    product = Product.create!()
    LineItem.create!(order_id: order.id, product_id: product.id)
    assert 1, LineItem.all.count
  end

  test "belongs to an order" do
    order = Order.create!()
    product = Product.create!()
    LineItem.create!(order_id: order.id, product_id: product.id)
    assert 1, order.line_items.count
  end

  test "belongs to a product" do
    order = Order.create!()
    product = Product.create!()
    LineItem.create!(order_id: order.id, product_id: product.id)
    assert 1, product.line_items.count
  end
end
