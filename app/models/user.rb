class User < ActiveRecord::Base
  has_one :monster
  has_many :entries
  has_many :moods, through: :entries

  has_secure_password
  validates :first_name, prescence: true
  validates :last_name, prescence: true
  validates :email, prescence: true, uniqueness: true, format: {width: //}
  validates :password, length: {in: 10..100}, confirmation: true
  validates :hometown, prescence: true
  validates :favorite_food, prescence: true
end