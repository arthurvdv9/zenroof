class Ticket < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :status, presence: true
  validates :priority, presence: true

  belongs_to :room
  has_many_attached :photos
end
