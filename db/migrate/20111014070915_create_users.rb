class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string    :username,            :null => false
      t.string    :email,               :null => true
      t.string    :crypted_password,    :null => false
      t.string    :password_salt,       :null => false
      t.string    :persistence_token,   :null => false
      t.timestamps
    end
    add_index :users, ["persistence_token"], :name => "index_users_on_persistence_token", :unique => true
  end

  def self.down
    drop_table :users
  end
end
