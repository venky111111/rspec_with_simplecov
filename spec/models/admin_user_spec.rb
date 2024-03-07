require 'rails_helper'

RSpec.describe AdminUser, type: :model do

  before do 
    @admin_user = AdminUser.new(email: 'admin@example1.com',password: 'password', password_confirmation: 'password')
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(@admin_user.valid?).to eq(true)
    end
    it 'requires email presence' do
      @admin_user.email=""
      expect(@admin_user.valid?).to eq(false)
      expect(@admin_user.errors[:email]).to include("can't be blank")
    end

    it 'requires password presence' do
      @admin_user.password = ""
       expect(@admin_user.valid?).to eq(false)
      expect(@admin_user.errors[:password]).to include("can't be blank")
    end
      it "is not valid with a duplicate email" do
      AdminUser.create(email: "admin@example.com", password: "password")
      admin_user = AdminUser.new(email: "admin@example.com", password: "password")
      expect(admin_user).not_to be_valid
    end

  end


end






