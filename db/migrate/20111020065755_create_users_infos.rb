class CreateUsersInfos < ActiveRecord::Migration
  def self.up
    create_table :users_infos do |t|
           t.integer    :user_id
           t.string     :first_name
           t.string     :last_name
           t.string     :gender
           t.boolean    :show_gender
           t.date       :birthday_date
           t.boolean    :show_birthday
           t.string     :homepage
           t.string     :hometown
           t.string     :languages
           t.string     :about_me
           t.string     :relationship
           t.string     :relationship_with
           t.boolean    :relationship_confirmed
           t.string     :interest
           t.string     :religion
           t.string     :religion_description
           t.string     :political_views
           t.string     :political_description
           t.string     :people_who_inspire_you
           t.string     :favorite_quotations
           t.string     :music
           t.string     :movies
           t.string     :books
           t.string     :television
           t.string     :games
      

      t.timestamps
    end
  end

  def self.down
    drop_table :users_infos
  end
end
