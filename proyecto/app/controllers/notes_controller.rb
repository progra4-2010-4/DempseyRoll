require 'rubygems'
require 'rufus/scheduler' 

class NotesController < ApplicationController

  def create
    scheduler = Rufus::Scheduler.start_new    

    @note = Note.new params[:note]

    if @note.save
	redirect_to new_note_path, :notice => "Success!"
	scheduler.at @note.delivery do
    		ReminderMail.new_remind_me_email(@note).deliver
  	end
    else
	redirect_to new_note_path, :notice => "You left one or more fields empty, try again."
    end
  end

  def new
    @note = Note.new
  end

end
