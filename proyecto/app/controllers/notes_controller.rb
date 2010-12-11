class NotesController < ApplicationController

  def create
    @note = Note.new params[:note]

    respond_to do |format|
    	if @note.save
		ReminderMail.new_remind_me_email(@note).deliver
	end
    end
  end

  def new
    @note = Note.new
  end

end
