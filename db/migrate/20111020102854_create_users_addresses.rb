class CreateUsersAddresses < ActiveRecord::Migration
  def self.up
    create_table :users_addresses do |t|
      t.integer :user_id
      t.string :address
      t.string :city
      t.string :state_province
      t.string :country
      t.string :zip_code
      t.string :zip_privacy
      
      t.timestamps
    end
  end

  def self.down
    drop_table :users_addresses
  end
end
