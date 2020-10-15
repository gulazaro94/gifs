RSpec.describe(GifsController, type: :controller) do
  describe('GET #new') do
    subject(:do_action) { get(:new) }

    it('renders :new') do
      expect(do_action).to render_template(:new)
    end
  end

  describe('POST #create') do
    subject(:do_action) { post(:create, params: { gif: gif_params }) }

    context('when the image is valid') do
      let(:gif_image) { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'earth.gif'), 'image/gif') }
      let(:gif_params) { { image: gif_image } }

      it('creates the gif with the attached image') do
        expect { do_action }.to change(Gif, :count).by(1)

        expect(response).to redirect_to(gifs_path)
        gif = Gif.last
        expect(gif.image).to be_attached
      end
    end

    context('when the image is invalid') do
      let(:jpg_image) { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'image.jpg'), 'image/jpg') }
      let(:gif_params) { { image: jpg_image } }

      it('fails and renders new') do
        expect { do_action }.not_to change(Gif, :count)

        expect(response).to render_template(:new)
      end
    end
  end
end
