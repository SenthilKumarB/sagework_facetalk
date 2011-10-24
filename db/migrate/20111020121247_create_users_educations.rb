class CreateUsersEducations < ActiveRecord::Migration
  def self.up
    create_table :users_educations do |t|
       t.integer :user_id
      t.string :high_school_institution
      t.string :college_university_institution
      t.timestamps
    end
  end

  def self.down
    drop_table :users_educations
  end
end
