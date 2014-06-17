class SysMessage < ActiveRecord::Base

	def send_message
		contact_id = self.contact_id
		msg = self.msg

		contact = Contact.find(contact_id)
		contact.comm_devices.each do |c_dev|
			if c_dev.carrier == 'email'
				Msgmailer.send_the_email(c_dev.number, msg).deliver
			end

		end

	end
end
