class User < ActiveRecord::Base
	acts_as_authentic
	has_one :users_info
    has_one :users_work
    has_one :users_address
    has_one :users_education
    has_one :users_phone
    has_one :users_profile_picture
    has_one :users_setting
    has_many :whats_up
    has_one :user_privacy
end
