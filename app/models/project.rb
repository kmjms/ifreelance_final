class Project < ApplicationRecord
  belongs_to :client
  belongs_to :freelance
  belongs_to :state
  belongs_to :type

  has_many :items, dependent: :destroy
  has_many :expenses, dependent: :destroy
end
