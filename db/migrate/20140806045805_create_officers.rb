class CreateOfficers < ActiveRecord::Migration
  def change
    create_table :officers do |t|
      t.string :username
      t.string :salted_password
      t.integer :chair_id
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
