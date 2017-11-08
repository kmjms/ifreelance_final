class ClientsAndFreelances < ActiveRecord::Migration[5.1]
  def change
    create_table :clients_freelances, id: false do |t|
      t.belongs_to :client, index: true
      t.belongs_to :freelance, index: true
    end
  end
end
