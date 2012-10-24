class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.string :remind_month
      t.string :remind_day
      t.string :remind_year
      t.string :type
      t.string :name
      t.string :message
      t.boolean :active

      t.timestamps
    end
  end
end
