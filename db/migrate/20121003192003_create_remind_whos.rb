class CreateRemindWhos < ActiveRecord::Migration
  def change
    create_table :remind_whos do |t|
      t.integer :reminder_id
      t.string :recipient

      t.timestamps
    end
  end
end
