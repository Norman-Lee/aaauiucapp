class CreateEventChairs < ActiveRecord::Migration
  def change
    create_join_table :events, :chairs do |t|
      t.index :event_id
      t.index :chair_id
    end
  end
end
