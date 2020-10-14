class GifLabel < ApplicationRecord

  belongs_to(:gif)

  validates(:gif, :label, presence: true)

end
