class User < ActiveRecord::Base
  has_one :monster
  has_many :entries
  has_many :moods, through: :entries

  has_secure_password
  validates :first_name, prescence: true
  validates :last_name, prescence: true
  validates :email, prescence: true, uniqueness: true, format: {width: /\A(?<username>[^@\s]+)@((?<domain_name>[-a-z0-9]+)\.(?<domain>[a-z]{2,}))\z/i}
  validates :password, length: {in: 10..100}, confirmation: true
  validates :hometown, prescence: true
  validates :favorite_food, prescence: true
end