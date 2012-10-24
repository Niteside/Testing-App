class Server < ActiveRecord::Base
  attr_accessible :ip, :name, :port, :tack_action, :command
  has_many :port
end
