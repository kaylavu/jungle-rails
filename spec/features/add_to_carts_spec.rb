require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
  end

  scenario "They click on add to cart" do
    # ACT
    visit root_path
    # page.find('footer').find_link('Add').trigger('click')
    click_on 'Add'

  
    # DEBUG
    save_screenshot
    
    # VERIFY
    # puts page.html
    # expect(page).to have_text 'My Cart (1) '
    expect(page).to have_text 'My Cart', count: 1

  

  end
end
