require 'rubygems'
require 'rufus/scheduler' 

scheduler = Rufus::Scheduler.start_new

scheduler.every '5m' do
	@note = Note.all
	Note.all.each do |n|
		if (Time.parse(n.delivery.to_s) - Time.now <= 300)
			ReminderMail.new_remind_me_email(n).deliver
			n.destroy
		end
	end
end
