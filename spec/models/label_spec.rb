RSpec.describe(Label) do
  describe('validations') do
    it('requires name') do
      label = Label.new

      expect(label).to be_invalid
      expect(label.errors[:name]).to eq(["can't be blank"])
    end

    it('validates name uniqueness') do
      Label.create(name: 'label1')

      label = Label.new(name: 'label1')
      expect(label).to be_invalid
      expect(label.errors[:name]).to eq(['has already been taken'])
    end
  end
end
