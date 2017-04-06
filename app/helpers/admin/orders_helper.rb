module Admin::OrdersHelper

  def pagination
    [
      first_page_link,
      back_link,
      next_link,
      last_page_link,
    ].compact.join("\n").html_safe
  end

  def first_page_link
    unless @page == 1
      link_to("First", admin_orders_path(page: 1))
    end
  end

  def last_page_link
    unless @page == @total_pages
      link_to("Last", admin_orders_path(page: @total_pages))
    end
  end

  def next_link
    if @page < @total_pages
      link_to("Next", admin_orders_path(page: @page + 1))
    end
  end

  def back_link
     if @page > 1
       link_to("Back", admin_orders_path(page: @page - 1))
     end
  end
end
