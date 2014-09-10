class AddMemberIdToOfficers < ActiveRecord::Migration
  def change
  	change_table :officers do |t|
  		t.integer :member_id
  	end
  end
end
