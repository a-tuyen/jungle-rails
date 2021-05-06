require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
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
  
    scenario "Navigate to the product detail page by clicking on a product in the homepage" do
      visit products_path

      click_on 'Details', match: :first

      sleep 1

      save_screenshot 'product-details.png'

      expect(page).to have_text 'Description'
  end
end
