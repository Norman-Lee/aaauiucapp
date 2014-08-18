class AddAttachmentCoverPhotoToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.attachment :cover_photo
      t.attachment :event_photo
    end
  end

  def self.down
    remove_attachment :events, :cover_photo
    remove_attachment :events, :event_photo
  end
end
