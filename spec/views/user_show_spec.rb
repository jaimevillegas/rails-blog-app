# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/index', type: :feature do
  before(:each) do
    @user = User.create(name: 'John Doe', photo: 'https://i.pravatar.cc/300',
                        bio: 'Alien biologist', posts_counter: 1)
    5.times do |i|
      Post.create(title: "Post - #{i}", text: 'This is the first post',
                  comments_counter: 5, likes_counter: 0, author_id: @user.id)
    end
    visit user_posts_path(id: @user.id)
  end

  it 'displays user profile photo' do
    expect(page).to have_css("img[src*='https://i.pravatar.cc/300']")
  end

  it 'displays username' do
    expect(page).to have_content(@user.name)
  end

  it 'displays number of posts' do
    expect(page).to have_content('Number of Posts: 5')
  end

  it "displays the user's first 3 posts" do
    expect(page).to have_content('Post - 1')
    expect(page).to have_content('Post - 2')
    expect(page).to have_content('Post - 3')
  end
end
