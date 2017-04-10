class Admin::BaseController < ApplicationController
  def admin_authorize!
    unless current_user && current_user.admin?
      redirect_to products_path
    end
  end

  def staff_authorize!
    unless current_user && (current_user.admin? || current_user.staff?)
      redirect_to products_path
    end
  end
end
