class House < ApplicationRecord
  include PgSearch::Model

  validates :name, presence: true
  validates :address, presence: true
  validates :capacity, presence: true, numericality: { only_integer: true }, inclusion: { in: 1..100 }

  has_many :rooms, dependent: :destroy
  has_many :tickets, through: :room

  belongs_to :user
  has_one_attached :photo


end
