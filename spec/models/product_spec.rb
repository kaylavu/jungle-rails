require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do 
  it "is valid with valid attributes" do
    @category = Category.find_or_create_by! name:"Apparel"
    @product = @category.products.create! ({
    name:  'Men\'s Classy shirt',
    quantity: 10,
    price: 64.99
    })
    expect(@product.id).to be_present 
  end

  it "is not valid without a name" do
    @category = Category.find_or_create_by! name:"Apparel"
    @product = @category.products.create ({
      name: nil, 
      quantity: 10,
      price: 64.99
    })
    expect(@product.id).to be_nil
  end
 
  it "is not valid without a price" do 
    @category = Category.find_or_create_by! name:"Apparel"
    @product = @category.products.create ({
      price:nil, 
      name:  'Men\'s Classy shirt',
      quantity: 10,
    })
    expect(@product.id).to be_nil
  end 

  it "is not valid without a quantity" do 
    @category = Category.find_or_create_by! name:"Apparel"
    @product = @category.products.create ({
      quantity: nil, 
      name:  'Men\'s Classy shirt',
      price: 64.99
    })
    expect(@product.id).to be_nil 
  end 

  it "is not valid without a category" do 
    @product = Product.new({
    category: nil, 
    name:  'Men\'s Classy shirt',
    quantity: 10,
    price: 64.99
    })
    expect(@product.id).to be_nil
  end 
end 

end
