class Admin::HomeController < Admin::BaseController
  before_action :admin_authorize!
  def index; end
end
