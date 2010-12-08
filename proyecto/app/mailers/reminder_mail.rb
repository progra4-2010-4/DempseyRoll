class ReminderMail < ActionMailer::Base
  default :from => "plz.remind.me@gmail.com"

	def new_remind_me_email(note)
		@note = note
		@content = note.content
		@email = note.email
		@delivery = note.delivery

		mail(:to => @email, :subject => "Reminder!!")
	end
end
