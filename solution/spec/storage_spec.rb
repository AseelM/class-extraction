require 'storage'

RSpec.describe Storage do
  subject(:storage) { described_class.new(passenger_limit) }
  let(:item)        { double('an item') }

  context 'not full' do
    let(:passenger_limit) { 1 }

    it 'adds an item' do
      expect(storage.add(item)).to eq [item]
    end
  end

  context 'is full' do
    let(:passenger_limit) { 0 }

    it 'throws error' do
      expect { storage.add(item) }.to raise_error('Limit Reached Error')
    end
  end
end
