class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"]
  # http_basic_authenticate_with name: "jungle", password: "book"
  def show
  end
end
