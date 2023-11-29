class Ticket < ApplicationRecord
  belongs_to :room
  has_many_attached :photos
end
