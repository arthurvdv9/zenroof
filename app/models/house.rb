class House < ApplicationRecord

  has_many :tickets, through: :room
  has_many :rooms
  
  belongs_to :user
  has_one_attached :photo
end
