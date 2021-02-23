class User < ActiveRecord::Base
  has_secure_password
  has_one :monster
  has_many :entries

end