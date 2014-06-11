class Contact < ActiveRecord::Base
	belongs_to :account
	has_many :comm_devices
end
