class User < ActiveRecord::Base
  has_secure_password
  validates :email, :password_digest, presence: true
  validates :email, uniqueness: true
  validates :name, presence: true, uniqueness: true

  has_one :monster, dependent: :destroy
  has_many :entries, dependent: :destroy
end