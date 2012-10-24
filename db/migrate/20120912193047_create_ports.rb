class CreatePorts < ActiveRecord::Migration
  def change
    create_table :ports do |t|
      t.integer :port
      t.boolean :actionable
      t.text :command
      t.integer :server_id

      t.timestamps
    end
  end
end
