class NotesController < ApplicationController
  def create
    @note = Note.new params[:note]
    @note.save
    redirect_to new_note_path, :notice => "You left one or more fields empty, try again."
    new_remind_me_email(@note).deliver
  end

  def new
    @note = Note.new
  end

end
