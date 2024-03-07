require 'rails_helper'

RSpec.describe Review, type: :model do
   before do 
    user = User.create(name: "syam", email: "syam@gmail.com")
    product = Product.create(name: "shampoo", price: "150", user_id: user.id)
    @review=Review.new(content: "Nice one",user_id: product.user_id, product_id: product.id)
    
  end
    
  
  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(@review.valid?).to eq(true)
    end

    it 'is not valid without a content' do
      @review.content=""
      expect(@review.valid?).to eq(false)
      expect(@review.errors[:content]).to include("can't be blank")
    end

    it 'is not valid without an user_id' do
     @review.user_id=""
      expect(@review.valid?).to eq(false)
      expect(@review.errors[:user_id]).to include("can't be blank")
    end
    it 'is not valid without an product_id' do
     @review.product_id=""
      expect(@review.valid?).to eq(false)
      expect(@review.errors[:product_id]).to include("can't be blank")
    end


   
  end
end
