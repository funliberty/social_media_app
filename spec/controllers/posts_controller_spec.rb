require "rails_helper"

RSpec.describe PostsController, type: :controller do
  describe '#show' do
    it "returns post with the given id" do
      post = FactoryBot.create(:post)

      get :show, params: { id: post.id }

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
    end

    it "returns 302 status when the post is not found" do
      get :show, params: { id: 87364857 }

      expect(response).to have_http_status(302)
      expect(response).to redirect_to(:root)
    end
  end
end
