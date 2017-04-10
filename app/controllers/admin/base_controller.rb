class Admin::BaseController < ApplicationController
  def admin_authorize!
    unless admin?
      redirect_to products_path
    end
  end
end
