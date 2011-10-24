class AddOmniAuthFieldsToUser < ActiveRecord::Migration
  def self.up
  	add_column :users, :provider, :string
  	add_column :users, :uid, :string
  	add_column :users, :nick_name, :string
  end

  def self.down
  	remove_column :users, :provider
  	remove_column :users, :uid
  	remove_column :users, :nick_name
  end
end
