require 'rails_helper'

RSpec.describe LineItemsController, type: :controller do
  it "exists" do
    assert LineItem
  end

  it "can be created" do
    order = Order.create!()
    product = Product.create!()
    LineItem.create!(order_id: order.id, product_id: product.id)
    expect(LineItem.all.count).to eq 1
  end

  it "belongs_to an order" do
    order = Order.create!()
    product = Product.create!()
    LineItem.create!(order_id: order.id, product_id: product.id)
    expect(order.line_items.count).to eq 1
  end

  it "belongs_to a product" do
    order = Order.create!()
    product = Product.create!()
    LineItem.create!(order_id: order.id, product_id: product.id)
    expect(product.line_items.count).to eq 1
  end
end
