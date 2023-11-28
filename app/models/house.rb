class House < ApplicationRecord
  has_many :tickets, through :rooms
end
