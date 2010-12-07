class NotesController < ApplicationController
  def create
    @note = Note.new params[:note]
    @note.save
    redirect_to new_note_path, :notice => "Su mierda se mando bien lipe"
  end

  def new
    @note = Note.new
  end

end
