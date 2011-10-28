class WhatsUp < ActiveRecord::Base
  belongs_to :user
  has_many :whats_up_comment
end
