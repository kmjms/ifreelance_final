class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.float :total_price
      t.references :client, foreign_key: true
      t.references :freelance, foreign_key: true
      t.references :state, foreign_key: true
      t.references :type, foreign_key: true

      t.timestamps
    end
  end
end
