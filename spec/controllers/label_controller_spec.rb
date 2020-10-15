RSpec.describe(LabelsController, type: :controller) do
  describe('GET #index') do
    subject(:do_action) { get(:index) }

    it('renders :index') do
      expect(do_action).to render_template(:index)
      expect(assigns(:labels)).to eq(Label.order(id: :desc).all)
    end
  end

  describe('GET #new') do
    subject(:do_action) { get(:new) }

    it('renders :new') do
      expect(do_action).to render_template(:new)
    end
  end

  describe('POST #create') do
    subject(:do_action) { post(:create, params: { label: label_params }) }

    context('when the image is valid') do
      let(:label_params) { { name: 'mylabel' } }

      it('creates the label') do
        expect { do_action }.to change(Label, :count).by(1)

        expect(response).to redirect_to(labels_path)
        label = Label.last
        expect(label).to have_attributes(name: 'mylabel')
      end
    end

    context('when the name is blank') do
      let(:label_params) { { name: '' } }

      it('fails and renders new') do
        expect { do_action }.not_to change(Label, :count)

        expect(response).to render_template(:new)
      end
    end
  end
end
