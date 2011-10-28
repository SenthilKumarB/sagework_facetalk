class CreateWhatsUps < ActiveRecord::Migration
  def self.up
    create_table :whats_ups do |t|
      t.integer :user_id
      t.string :whats_up_type
      t.string :url
      t.string :description
      t.integer :for_id
      t.integer :status
      t.timestamps
    end
  end

  def self.down
    drop_table :whats_ups
  end
end
