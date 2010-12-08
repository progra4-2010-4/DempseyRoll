class ReminderMail < ActionMailer::Base
  default :from => "from@example.com"

	def new_remind.me_email (note)
		@note = note
		@content = note.content
		@email = note.email
		@delivery = note.delivery

		mail :to => @email, :subject => "Reminder!!" , #:body => @content
	end
end
