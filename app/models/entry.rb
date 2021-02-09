class Entry < ActiveRecord::Base
  has_one :mood
  belongs_to :user
end