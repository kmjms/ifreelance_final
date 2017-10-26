class Item < ApplicationRecord
  belongs_to :project

  validates :price, presence: true
  
  before_create:add_price
  before_destroy:remove_price
  
  private

    def add_price
        project = Project.find(self.project_id)
        project.total_price = project.total_price + self.price
        project.save
    end

    def remove_price
      project = Project.find(self.project_id)
      project.total_price = project.total_price - self.price
      project.save
    end
end
