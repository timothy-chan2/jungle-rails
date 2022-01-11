require 'rails_helper'

RSpec.feature "Visitor navigates from home page to the product detail page", type: :feature, js: true do
  
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

  scenario "They see all products" do
    visit root_path
    find('.pull-right', match: :first).click
    expect(page).to have_css 'article.product-detail'

    # Commented out b/c it's for debugging only
    # save_screenshot
  end

end
