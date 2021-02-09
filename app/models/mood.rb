class Mood < ActiveRecord::Base
  belongs_to :entry
  has_one :user, through: :entry
end