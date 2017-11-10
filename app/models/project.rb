class Project < ApplicationRecord
  belongs_to :client
  belongs_to :freelance
  belongs_to :state
  belongs_to :type

  has_many :items, dependent: :destroy
  has_many :expenses, dependent: :destroy
  
  
  
    # calculos internos de la aplicacion
  def self.calculate_incomes_by_project(projectId)
    project = Project.find(projectId)
    return project.items.sum(:price)
  end

  def self.calculate_expenses_by_project(projectId)
    project = Project.find(projectId)
    return project.expenses.sum(:price)
  end

  def self.calculate_all_incomes(freelance)
      projects = freelance.projects
      total_income = 0

      projects.each do |proj|
        total_income += proj.items.sum(:price)
      end

      return total_income
  end

  def self.calculate_all_expenses(freelance)
    projects = freelance.projects
      
    total_expenses = 0

    projects.each do |proj|
      total_expenses += proj.expenses.sum(:price)
    end

    return total_expenses
  end
  
  def calculate_all_incomes(freelance)
    projects = freelance.projects
    total_income = 0

    projects.each do |proj|
      total_income += proj.items.sum(:price)
    end

    return total_income
end

def calculate_all_expenses(freelance)
  projects = freelance.projects
    
  total_expenses = 0

  projects.each do |proj|
    total_expenses += proj.expenses.sum(:price)
  end

  return total_expenses
end


  
    
end
