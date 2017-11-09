class CreateSupports < ActiveRecord::Migration[5.1]
  def change
    create_table :supports do |t|
      t.references :client, foreign_key: true
      t.references :freelance, foreign_key: true
      
      t.timestamps
    end
  end
end
