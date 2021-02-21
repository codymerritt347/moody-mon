class User < ActiveRecord::Base
  has_one :monster
  has_many :entries

end