class DropServerFields < ActiveRecord::Migration
  def up
    change_table :servers do |t|
      t.remove :port, :command
    end
  end

  def down
  end
end
