class UsersProfilePicture < ActiveRecord::Base
  belongs_to :user

      has_attached_file :photo, :styles => { :small => "100x100#", :large => "500x500>" },
     :url => "/system/:attachment/:id/:style/:basename.:extension",
     :path => ":rails_root/public/system/:attachment/:id/:style/:basename.:extension"
end
