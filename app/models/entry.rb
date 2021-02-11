class Entry < ActiveRecord::Base
  belongs_to :user
  has_one :mood
end