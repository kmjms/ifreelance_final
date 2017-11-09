class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :support, foreign_key: true
      t.string :sender_name
      t.boolean :sender_type
      
      t.timestamps
    end
  end
end
