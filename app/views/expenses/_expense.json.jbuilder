json.extract! expense, :id, :description, :price, :project_id, :created_at, :updated_at
json.url expense_url(expense, format: :json)
