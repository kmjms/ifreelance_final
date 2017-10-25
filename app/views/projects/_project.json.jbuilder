json.extract! project, :id, :name, :description, :start_date, :end_date, :total_price, :client_id, :freelance_id, :state_id, :type_id, :created_at, :updated_at
json.url project_url(project, format: :json)
