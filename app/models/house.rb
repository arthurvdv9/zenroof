class House < ApplicationRecord
  has_many :tickets, through: :room
  belongs_to :user
  has_one_attached :photo
end
