require 'rubygems'
require 'rufus/scheduler'
require 'chronic'

scheduler = Rufus::Scheduler.start_new

scheduler.every '5m' do
	Note.all.each do |n|
		timex = Time.now - Chronic.parse(n.delivery.to_s)
		puts timex
		if (timex >= 0)
			if (timex <= 300)
				ReminderMail.new_remind_me_email(n).deliver
				n.destroy
			else
				n.content += " [Sorry for the delay, seems like we had problems!]"
				ReminderMail.new_remind_me_email(n).deliver
				n.destroy
			end
		end
	end
end
