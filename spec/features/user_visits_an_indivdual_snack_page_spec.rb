require 'rails_helper'

feature 'When a user visits a snack show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack_1 = dons.snacks.create(name: 'Cheetos', price: '400')
    snack_2 = dons.snacks.create(name: 'Fritos', price: '200')
    expected_avg = 300
    types_of_snacks = 2

    visit snack_path(snack_1)

    expect(page).to have_content(snack_1.name)
    expect(page).to have_content(snack_1.price)
    expect(page).to have_content(dons.location)
    expect(page).to have_content(types_of_snacks)
  end
end
