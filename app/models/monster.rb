class Monster < ActiveRecord::Base
  belongs_to :user

  # validates :name, prescence: true
end