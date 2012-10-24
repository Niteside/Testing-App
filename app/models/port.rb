class Port < ActiveRecord::Base
  attr_accessible :actionable, :command, :port, :server_id
  belongs_to :server
end
