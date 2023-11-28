class Room < ApplicationRecord
  belongs_to :user
  belongs_to :house
  has_many :tickets
end
