require 'rubygems'
require 'rufus/scheduler' 

scheduler = Rufus::Scheduler.start_new

scheduler.every '1m' do
	@note = Note.all
	Note.all.each do |n|
		if (n.delivery - Time.at(0) <= 300 || n.delivery - Time.at(0) >= -300)
			ReminderMail.new_remind_me_email(n).deliver
			n.destroy
		end
	end
end
