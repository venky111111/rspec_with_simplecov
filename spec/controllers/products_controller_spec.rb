# spec/controllers/products_controller_spec.rb
require 'rails_helper'

RSpec.describe ProductsController, type: :controller do


    describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to have_http_status(:ok)
    end

   
  
  end

  describe 'GET #show' do
    let(:product) { FactoryBot.create(:product) }

    it 'returns a success response' do
      get :show, params: { id: product.to_param }
     expect(response).to be_successful
    end
  end


  describe 'POST #create' do
    context 'with valid parameters' do
      let(:valid_params) { { product: { name: 'Test Product', price: 100, user_id: FactoryBot.create(:user).id } } }

      it 'creates a new product' do
        expect {
          post :create, params: valid_params
        }.to change(Product, :count).by(1)
      end

      it 'returns a success response' do
        post :create, params: valid_params
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) { { product: { name: nil, price: 100, user_id: FactoryBot.create(:user).id } } }

      it 'does not create a new product' do
        expect {
          post :create, params: invalid_params
        }.to_not change(Product, :count)
      end

      it 'returns an unprocessable entity response' do
        post :create, params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT #update' do
    let(:product) { FactoryBot.create(:product) }

    context 'with valid parameters' do
      let(:new_attributes) { { name: 'New Name' } }

      it 'updates the requested product' do
        put :update, params: { id: product.to_param, product: new_attributes }
        product.reload
        expect(product.name).to eq('New Name')
      end

      it 'returns a success response' do
        put :update, params: { id: product.to_param, product: new_attributes }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) { { name: nil } }

      it 'does not update the product' do
        put :update, params: { id: product.to_param, product: invalid_attributes }
        product.reload
        expect(product.name).not_to be_nil
      end

      it 'returns an unprocessable entity response' do
        put :update, params: { id: product.to_param, product: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:product) { FactoryBot.create(:product) }

    it 'destroys the requested product' do
      expect {
        delete :destroy, params: { id: product.to_param }
      }.to change(Product, :count).by(-1)
    end

    it 'returns a no content response' do
      delete :destroy, params: { id: product.to_param }
      expect(response).to have_http_status(:no_content)
    end
  end
end
