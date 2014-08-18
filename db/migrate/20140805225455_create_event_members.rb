class CreateEventMembers < ActiveRecord::Migration
  def change
    create_join_table :members, :events do |t|
      t.index :member_id
      t.index :event_id
    end
  end
end
