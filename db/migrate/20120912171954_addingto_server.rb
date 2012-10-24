class AddingtoServer < ActiveRecord::Migration
  def up

    add_column  :servers, :tack_action, :boolean
    add_column  :servers, :command, :string

  end

  def down
  end
end
