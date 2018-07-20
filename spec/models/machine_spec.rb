require 'rails_helper'

describe Machine, type: :model do
  describe 'relationships' do
    it {should have_many(:machine_snacks)}
    it {should have_many(:snacks).through(:machine_snacks)}
  end
  describe 'calculations' do
    it 'finds average price of snacks' do
      owner = Owner.create(name: 'Bobby')
      machine = Machine.create(location: 'Panama', owner_id: 1)
      machine.snacks.create(name: 'Cheetos', price: '400')
      machine.snacks.create(name: 'Fritos', price: '200')
      expected_avg = 300

      expect(Machine.average_snack_price).to eq(expected_avg)
    end
  end
end
