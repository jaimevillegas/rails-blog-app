require 'rails_helper'

RSpec.describe 'posts/index', type: :feature do
  before(:each) do
    @user = User.create(name: 'John Doe', photo: 'https://i.pravatar.cc/300', bio: 'Alien biologist', posts_counter: 1)
    @first_post = Post.create(title: 'First post', text: 'This is the first post',
                              comments_counter: 5, likes_counter: 0, author_id: @user.id)
    5.times do |i|
      Comment.create(text: "This is comment ##{i}", author_id: @user.id, post_id: @first_post.id)
    end
    visit user_show_path(@first_post.author_id, @first_post)
  end

  it 'displays post text' do
    expect(page).to have_content('This is the first post')
  end

  it 'displays post title' do
    expect(page).to have_content('First post')
  end

  it 'displays number of comments' do
    expect(page).to have_content('Comments: 5')
  end

  it 'displays number of likes' do
    expect(page).to have_content('Likes: 0')
  end

  it 'displays username' do
    expect(page).to have_content(@user.name)
  end

  it 'displays number of posts' do
    expect(page).to have_content('Number of Posts: 1')
  end

  it 'displays user photo' do
    expect(page).to have_css("img[src*='https://i.pravatar.cc/300']")
  end
end
