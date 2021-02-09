class User < ActiveRecord::Base
  has_secure_password # REMINDER: auto validation, must be created
  has_one :monster
  has_many :entries
  has_many :moods, through: :entries
end