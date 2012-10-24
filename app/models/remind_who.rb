class RemindWho < ActiveRecord::Base
  attr_accessible :recipient, :reminder_id
  belongs_to :reminder
end
