class CreateNotes < ActiveRecord::Migration
  def self.up
    create_table :notes do |t|
      t.text :content
      t.string :email
      t.DateTime :delivery

      t.timestamps
    end
  end

  def self.down
    drop_table :notes
  end
end
