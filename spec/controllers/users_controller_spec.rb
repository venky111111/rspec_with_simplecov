require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    let!(:user) { create(:user) } 

  describe 'GET #user_products' do

    it 'returns a list of products belonging to the user' do
      p1 = create(:product, user: user)
      p2 = create(:product, user: user)
      get :user_products, params: { id: user.id }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(2)
      expect(JSON.parse(response.body).map { |p| p['id'] }).to include(p1.id, p2.id)
    end
  end
  describe 'GET #user_reviews' do
    it 'returns a list of reviews written by the user' do
      r1 = create(:review, user: user)
      r2 = create(:review, user: user)

      get :user_reviews, params: { id: user.id }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(2)
      expect(JSON.parse(response.body).map { |r| r['id'] }).to include(r1.id, r2.id)
    end
  end
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    let!(:user) { User.create(name: 'Johnu', email: 'johnu@example.com') } # Use let! to create the user eagerly

    it 'returns a success response' do
      expect(user).to be_valid # Verify that the user object is valid
      get :show, params: { id: user.id } # Pass the user's id
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    it 'creates a new user' do
     
      post :create, params: { user: { name: 'Johnu', email: 'johnu@example.com' } }

      expect(response).to have_http_status(:ok)
    end
  end
  describe 'Could not without credentials POST #create' do
    it 'creates a new user' do
     
      post :create, params: { user: { name: '', email: '' } }
      
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end


  describe 'PATCH #update' do
    let!(:user) { User.create(name: 'Johnu', email: 'johnu@example.com') }

    it 'updates the user' do
      new_name = 'Johnny'
      patch :update, params: { id: user.id, user: { name: new_name } }
      user.reload
      expect(user.name)===(new_name)
      expect(response).to have_http_status(:ok)
    end
  end
  describe 'PATCH #update' do
    let!(:user) { User.create(name: 'Johnu', email: 'johnu@example.com') }

    it 'updates the user' do
      new_name = ''
      patch :update, params: { id: user.id, user: { name: new_name } }
      user.reload
      expect(user.name)===(new_name)
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'DELETE #destroy' do
    let!(:user) { User.create(name: 'Johnu', email: 'johnu@example.com') }

    it 'destroys the user' do
      expect {
        delete :destroy, params: { id: user.id }
      }.to change(User, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
