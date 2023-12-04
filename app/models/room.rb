class Room < ApplicationRecord
  validates :number, presence: true, numericality: { only_integer: true }, inclusion: { in: 1..100 }

  belongs_to :user
  belongs_to :house
  has_many :tickets, dependent: :destroy
end
