class Gif < ApplicationRecord
  MAX_IMAGE_SIZE_BYTES = 10.megabytes

  has_one_attached :image

  has_many(:gif_labels, dependent: :destroy)
  accepts_nested_attributes_for(:gif_labels, reject_if: :all_blank, allow_destroy: true)

  validates(:image, presence: true)
  validate(:validate_image_size)
  validate(:validate_image_content_type)

  private

  def validate_image_size
    return unless image.attached?
    return if image.blob.byte_size < MAX_IMAGE_SIZE_BYTES

    errors.add(:image, 'size exceeded')
  end

  def validate_image_content_type
    return unless image.attached?
    return if image.blob.content_type.starts_with?('image/gif')

    errors.add(:image, 'is not a GIF')
  end
end
