class WhatsUpComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :whats_up
end
