RSpec.describe(Gif, type: :model) do
  let(:gif_image) { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'earth.gif'), 'image/gif') }
  let(:jpg_image) { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'image.jpg'), 'image/jpg') }

  describe('validations') do
    it('fails when file size is greater then MAX_IMAGE_SIZE_BYTES') do
      stub_const('Gif::MAX_IMAGE_SIZE_BYTES', 1.byte)

      gif = described_class.new(image: gif_image)

      expect(gif).to be_invalid
      expect(gif.errors[:image]).to eq(['size exceeded'])
    end

    it('fails when file has a different content type') do
      gif = described_class.new(image: jpg_image)

      expect(gif).to be_invalid
      expect(gif.errors[:image]).to eq(['is not a GIF'])
    end
  end
end
