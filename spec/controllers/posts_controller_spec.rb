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
  describe "create" do
    it "creates a new post when the required params are given" do
        expect { post :create, params: { post: { title: 'Hello world', description: 'Mi descripción' } } }.to change(Post, :count).by(1)
    end
    it "does not create a new post when one param is missing" do
        expect { post :create, params: { post: { title: 'Hello world', description: nil } } }.to change(Post, :count).by(0)
    end
  end
end
