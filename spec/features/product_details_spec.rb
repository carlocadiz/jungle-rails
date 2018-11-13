require 'rails_helper'

RSpec.feature "Visitor navigates to product detail", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see one product" do

    visit root_path
    first('.product').click_on('Details')
    sleep 1
    # VERIFY
    expect(page).to have_css '.products-show'
    save_screenshot
  end
end
