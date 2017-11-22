class DashboardController < ApplicationController
  before_action :authenticate_freelance!
  layout 'dashboard'
  def index
    @freelance = current_freelance
    @projects = current_freelance.projects.all
    @incomes = Project.calculate_all_incomes(current_freelance)
    @expenses = Project.calculate_all_expenses(current_freelance)

  end
  
end
