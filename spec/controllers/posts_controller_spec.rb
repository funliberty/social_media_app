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

  describe "update" do
    it "returns to the root page when the posts is not found" do
      put :update, params: { id: 321546847, post: { title: "hello" } }

      expect(response).to have_http_status(302)
      expect(response).to redirect_to(:root)
    end

    it "updates the given post when the post ID is found." do
      post_item = FactoryBot.create(:post)

      patch :update, params: { id: post_item.id, post: { title: 'New title' } }

      post_item.reload

      expect(post_item.title).to eq('New title')
      expect(response).to redirect_to(post_path(post_item.id))
    end

    it "will not update when one of the required parameters is missing" do
      post_item = FactoryBot.create(:post)

      patch :update, params: { id: post_item.id, post: { title: '' } }

      post_item.reload

      expect(post_item.title).to eq("Hello, this is my first post")
      expect(response).to render_template(:edit)
    end
  end
end
