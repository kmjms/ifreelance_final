class DashboardController < ApplicationController
  before_action :authenticate_freelance!

  def index
    @freelance = current_freelance
    @projects = current_freelance.projects.all
    @incomes = calculate_all_incomes
    @expenses = calculate_all_expenses
  end
  
end
