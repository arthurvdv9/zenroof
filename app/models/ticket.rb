class Ticket < ApplicationRecord
  belongs_to :rooms
  has_many_attached :photos
end
