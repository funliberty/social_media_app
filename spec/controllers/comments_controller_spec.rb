require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe 'POST #create' do
    it 'creates a new comment when valid parameters are provided' do
      post_item = FactoryBot.create(:post)
      comment_params = { content: 'This is my first comment', post_id: post_item.id }

      post :create, params: { comment: comment_params }

      expect(Comment.last.content).to eq('This is my first comment')
    end

    it 'does not create a comment when invalid parameters are provided' do
      post_item = FactoryBot.create(:post)
      comment_params = { content: '', post_id: post_item.id, name: 'Jonh Doe' }

      post :create, params: { comment: comment_params }

      expect(response).to have_http_status(:redirect)
   end
  end
end
