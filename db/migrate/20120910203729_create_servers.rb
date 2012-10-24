class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.text :ip
      t.text :port
      t.text :name

      t.timestamps
    end
  end
end
