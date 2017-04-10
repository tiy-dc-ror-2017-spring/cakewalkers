class BakeryJob < ApplicationJob
  queue_as :default

  def send_order(order)
    #code
  end
end
