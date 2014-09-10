class AddAuthenticationTokenToOfficers < ActiveRecord::Migration
  def change
  	add_column :officers, :auth_token, :string, default: ""
  	add_index :officers, :auth_token, unique: true
  end
end
