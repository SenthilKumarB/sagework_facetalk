class CreateUsersProfilePictures < ActiveRecord::Migration
  def self.up
    create_table :users_profile_pictures do |t|
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :users_profile_pictures
  end
end
