class CreateUsersPhones < ActiveRecord::Migration
  def self.up
    create_table :users_phones do |t|
      t.integer :user_id
      t.string :mobile_type
      t.string :mobile_number
      t.string :findeble
      t.boolean :visiblity
      t.timestamps
    end
  end

  def self.down
    drop_table :users_phones
  end
end
