  

require 'rails_helper'

RSpec.describe 'Admin Users Form', type: :feature do
  let(:admin_user) { create(:admin_user) }

  before do
    login_as(admin_user, scope: :admin_user)
    visit new_admin_admin_user_path
    sign_in admin_user
  end

  describe 'form' do
    it 'displays the form fields for admin user' do
      expect(page).to have_field('Email')
      expect(page).to have_field('Password')
      expect(page).to have_field('Password confirmation')
    end

   end
    describe 'displays the list of admin users with columns and actions' do
  it 'displays the list of admin users with columns and actions' do
    visit admin_admin_users_path

    expect(page).to have_content('Email')
    expect(page).to have_content('Created at')
    expect(page).to have_content('Actions')

  end
end

end
