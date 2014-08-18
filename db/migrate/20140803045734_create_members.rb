class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :class_standing
      t.string :sex
      t.string :e_mail
      t.float :attendance_level
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
