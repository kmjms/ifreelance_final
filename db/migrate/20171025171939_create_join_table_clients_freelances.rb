class CreateJoinTableClientsFreelances < ActiveRecord::Migration[5.1]
  def change
    create_join_table :clients, :freelances do |t|
       t.index [:client_id, :freelance_id]
       t.index [:freelance_id, :client_id]
    end
  end
end
