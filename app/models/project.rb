class Project < ApplicationRecord
  belongs_to :client
  belongs_to :freelance
  belongs_to :state
  belongs_to :type
end
