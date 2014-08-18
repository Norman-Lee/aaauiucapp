class CreateChairs < ActiveRecord::Migration
  def change
    create_table :chairs do |t|
      t.string :chair_type
      t.integer :officer_1_id
      t.integer :officer_2_id
      
      t.timestamps
    end
  end
end
