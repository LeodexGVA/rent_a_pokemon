class Pokemon < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many_attached :image
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :image, presence: true
  validates :type, presence: true
end
