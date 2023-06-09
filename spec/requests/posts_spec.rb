require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:each) do
      @user = User.create(name: 'Test', photo: 'https://test', bio: 'This is a test.')
      # get '/users/1/posts'
      get user_posts_path(@user)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'renders the correct content' do
      expect(response.body).to include('Posts')
    end
  end
  describe 'GET /show' do
    before(:each) do
      @user = User.create(name: 'Test', photo: 'https://test', bio: 'This is a test.')
      @post = Post.create(author_id: @user.id, title: 'Hello test', text: 'This is my test')
      get user_post_path(@user, @post)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end

    it 'renders the correct content' do
      expect(response.body).to include('Show posts by user ID')
    end
  end
end
