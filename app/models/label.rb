class Label < ApplicationRecord
  has_many :gif_labels

  validates(:name, presence: true, length: { maximum: 255 }, uniqueness: true)
end
