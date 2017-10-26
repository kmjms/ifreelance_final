class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def calculate_all_incomes
    projects = current_freelance.projects
    total_income = 0

    projects.each do |proj|
      total_income += proj.items.sum(:price)
    end

    return total_income
end

def calculate_all_expenses
  projects = current_freelance.projects
    
  total_expenses = 0

  projects.each do |proj|
    total_expenses += proj.expenses.sum(:price)
  end

  return total_expenses
end


def not_found
  raise ActionController::RoutingError.new('Not Found')
end
  
end
