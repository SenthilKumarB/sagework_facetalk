class CreateUsersWorks < ActiveRecord::Migration
  def self.up
    create_table :users_works do |t|
      t.integer :user_id
      t.string :employer
      t.string :position
      t.string :description
      t.string :city
      t.string :state_province
      t.string :country
      t.boolean :current_job
      t.date   :start_in
      t.date   :end_in

      t.timestamps
    end
  end

  def self.down
    drop_table :users_works
  end
end
