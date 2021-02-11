class User < ActiveRecord::Base
  has_secure_password #password, password=, authenticate, pw_confirmation, ...
  has_one :monster
  has_many :entries
  has_many :moods, through: :entries
end