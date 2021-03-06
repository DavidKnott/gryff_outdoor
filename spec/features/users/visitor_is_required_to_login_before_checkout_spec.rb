require 'rails_helper'

RSpec.feature 'Visitor is required to login to account before checkout', type: :feature do

  scenario "an existing user and a cart with items" do
    user = create(:user)
    item = create(:item)

    visit item_path(item)
    click_on "Add Item"
    click_on "Add Item"
    click_on "View Cart"

    click_on "Log in or Create Account to Checkout"

    fill_in 'email', with: user.email
    fill_in 'password', with: user.password

    click_button 'Log in'

    click_on 'View Cart'

    click_on 'Checkout'

    expect(current_path).to eq(new_charge_path)

  end
end
