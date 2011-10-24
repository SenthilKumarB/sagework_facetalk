class CreateUsersSettings < ActiveRecord::Migration
  def self.up
    create_table :users_settings do |t|
      t.integer :user_id
      t.string :timezone
      t.string :language
      t.string :currency

      t.timestamps
    end
  end

  def self.down
    drop_table :users_settings
  end
end
