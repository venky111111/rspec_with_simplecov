require 'rails_helper'

RSpec.describe User, type: :model do

  before do 
    @user=User.new(name:"syamV", email:"syam@gmail.com")
  end
    
  
  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(@user.valid?).to eq(true)
    end

    it 'is not valid without a name' do
      @user.name=""
      expect(@user.valid?).to eq(false)
      expect(@user.errors[:name]).to include("can't be blank")
    end

    it 'is not valid without an email' do
     @user.email=""
      expect(@user.valid?).to eq(false)
      expect(@user.errors[:email]).to include("can't be blank")
    end

   
  end
end
