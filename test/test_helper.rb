ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def login_admin
    post sessions_path, params: { email: "admin@admin.com", password: 'password' }
  end

  def login_staff
    post sessions_path, params: { email: "staff@staff.com", password: 'password' }
  end
end
