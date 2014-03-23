class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.string :title
      t.string :url
      t.string :description
      t.integer :user_id
      t.boolean :is_active

      t.timestamps
    end
  end
end
