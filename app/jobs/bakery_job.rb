class BakeryJob < ApplicationJob
  queue_as :default

  def perform(order)
    order.line_items.each do |line_item|
      HTTParty.post("https://cakewalkers-api.herokuapp.com/bake_jobs/#{line_item.product.code}",
        {
          body: [{ bake_job: { quantity: line_item.quantity } }].to_json
        }
      )
    end
  end
end
