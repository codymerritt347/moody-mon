class Entry < ActiveRecord::Base
  belongs_to :user
  has_one :mood
  
  # validates :title, prescence: true
  # validates :note, prescence: true
end