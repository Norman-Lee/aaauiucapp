class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.datetime :event_time
      t.text :desc
      t.datetime :deploy_time

      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
