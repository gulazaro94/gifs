class GifLabel < ApplicationRecord
  belongs_to(:gif)
  belongs_to(:label)

  validates(:gif, :label, presence: true)
  validates(:label_id, uniqueness: { scope: :gif_id })
end
