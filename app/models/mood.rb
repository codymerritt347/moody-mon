class Mood < ActiveRecord::Base
  belongs_to :entry
  has_one :user, through: :entry
  
  # validates :name, prescence: true
  # validates :effect, prescence: true
  # validates :amount, prescence: true
end