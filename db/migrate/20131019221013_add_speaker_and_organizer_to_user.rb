class AddSpeakerAndOrganizerToUser < ActiveRecord::Migration
  def change
    add_column :users, :speaker, :boolean
    add_column :users, :organizer, :boolean
  end
end
