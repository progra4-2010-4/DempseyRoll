class NotesController < ApplicationController

  def create
    @note = Note.new params[:note]

    if @note.save
	redirect_to new_note_path, :notice => "Success!"
    	#ReminderMail.new_remind_me_email(@note).deliver
    else
	redirect_to new_note_path, :notice => "You left one or more fields empty, try again."
    end
  end

  def new
    @note = Note.new
  end

end
