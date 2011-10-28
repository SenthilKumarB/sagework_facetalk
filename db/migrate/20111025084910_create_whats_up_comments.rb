class CreateWhatsUpComments < ActiveRecord::Migration
  def self.up
    create_table :whats_up_comments do |t|
      t.integer :whats_up_id
      t.integer :user_id
      t.string  :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :whats_up_comments
  end
end
