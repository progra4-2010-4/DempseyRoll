class Note < ActiveRecord::Base
  validates_presence_of :content, :delivery, :email
end
