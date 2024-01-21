class DashboardController < ApplicationController
  before_action :authenticate_admin!
  layout 'dashboard/dashboard'
  
  def index
    @q = User.ransack(params[:q], auth_object: current_admin)
    @users = @q.result.order(:id).page(params[:page])
  end
end
