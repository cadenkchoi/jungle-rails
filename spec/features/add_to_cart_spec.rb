require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
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

  scenario "clicking 'Add to Cart' button increments My Cart by 1" do

    visit root_path
    # save_screenshot 'pre_click_cart_0.png'
    expect(page).to have_css 'article.product', count: 10

    find_button('Add', match: :first).click

    #DEBUG
    # sleep 1
    # save_screenshot 'post_click_cart_1.png'

    #VERIFY
    expect(page).to have_content 'My Cart (1)'

  end
  
end