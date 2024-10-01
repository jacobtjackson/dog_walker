class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @week = params[:start_date] ? params[:start_date].to_date.all_week : Date.today.all_week
  end
end
