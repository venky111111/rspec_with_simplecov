# # spec/controllers/reviews_controller_spec.rb
# require 'rails_helper'

# RSpec.describe ReviewsController, type: :controller do
#   describe 'POST #create' do
#     context 'with valid parameters' do
    
#       let!(:valid_params) { { review: FactoryBot.attributes_for(:review) } }

#       it 'creates a new review' do
#         expect {
#           post :create, params: valid_params
#         }.to change(Review, :count).by(1)
#       end

#       it 'redirects to the created review' do
#         post :create, params: valid_params
#         expect(response).to redirect_to(Review.last)
#       end
#     end
#   end
#   # describe 'PUT #update' do
#   #   let(:review) { FactoryBot.create(:review) }

#   #   context 'with valid parameters' do
#   #     let(:new_attributes) { { content: 'Updated review' } }

#   #     it 'updates the requested review' do
#   #       put :update, params: { id: review.to_param, review: new_attributes }
#   #       review.reload
#   #       expect(review.content).to eq('Updated review')
#   #     end

#   #     it 'redirects to the review' do
#   #       put :update, params: { id: review.to_param, review: new_attributes }
#   #       expect(response).to redirect_to(review)
#   #     end
#   #   end

#   #   context 'with invalid parameters' do
#   #     let(:invalid_attributes) { { content: nil } }

#   #     it 'does not update the review' do
#   #       put :update, params: { id: review.to_param, review: invalid_attributes }
#   #       review.reload
#   #       expect(review.content).not_to be_nil
#   #     end

#   #     it 'renders the :edit template' do
#   #       put :update, params: { id: review.to_param, review: invalid_attributes }
#   #       expect(response).to render_template(:edit)
#   #     end
#   #   end
#   # end

#   # describe 'DELETE #destroy' do
#   #   let!(:review) { FactoryBot.create(:review) }

#   #   it 'destroys the requested review' do
#   #     expect {
#   #       delete :destroy, params: { id: review.to_param }
#   #     }.to change(Review, :count).by(-1)
#   #   end

#   #   it 'redirects to the reviews list' do
#   #     delete :destroy, params: { id: review.to_param }
#   #     expect(response).to redirect_to(reviews_url)
#   #   end
#   # end
# end
