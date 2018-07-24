require 'rails_helper'

RSpec.feature "Visitor navigates to product details", type: :feature, js: true do
  

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

  scenario "They click on a product detail" do
    # ACT
    visit root_path
    page.find('footer').find_link('Details').trigger('click')
    # click_on 'Details'

    

    # DEBUG
    
    # VERIFY
    expect(current_path).to eql '/products/1'
    page.save_screenshot('screenshot.png')
    puts page.html
    page.save_screenshot('product-detail.png')

  end

end
