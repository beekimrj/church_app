class PagesController < ApplicationController
  def home
    @dashboard = DashboardService
  end
end
