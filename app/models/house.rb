class House < ApplicationRecord
  has_many :tickets, through :rooms
  belongs_to :user
  has_one_attached :photo
end
