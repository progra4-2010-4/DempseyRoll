require 'rubygems'
require 'rufus/scheduler' 

scheduler = Rufus::Scheduler.start_new

scheduler.every '1m' do
	#puts 'yay'
	@note = Note.last
	ReminderMail.new_remind_me_email(@note).deliver
end
