class CreateUserPrivacies < ActiveRecord::Migration
  def self.up
    create_table :user_privacies do |t|
      t.integer :user_id
      t.string :privacy_type

      t.timestamps
    end
  end

  def self.down
    drop_table :user_privacies
  end
end
