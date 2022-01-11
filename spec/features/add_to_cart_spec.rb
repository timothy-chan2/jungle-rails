require 'rails_helper'

RSpec.feature "Visitor add a product to their cart", type: :feature, js: true do
  
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    3.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see one product added to the cart after clicking add button" do
    visit root_path
    expect(page).to have_css('.my-cart', text: 'My Cart (0)')
    find('.add-product-to-cart', match: :first).click
    expect(page).to have_css('.my-cart', text: 'My Cart (1)')
    
    # Commented out b/c it's for debugging only
    # save_screenshot
  end

end
