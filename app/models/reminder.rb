class Reminder < ActiveRecord::Base
  attr_accessible :active, :message, :name, :remind_day, :remind_month, :remind_year, :type
  has_many :remindwhos
end
