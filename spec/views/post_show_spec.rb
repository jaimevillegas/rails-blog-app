require 'rails_helper'

RSpec.describe 'posts/show', type: :feature do
  before(:each) do
    @user = User.create(name: 'Jaime', photo: 'https://i.pravatar.cc/300', bio: 'Alien biologist', posts_counter: 1)
    @first_post = Post.create(title: 'First post', text: 'This is the first post',
                              comments_counter: 5, likes_counter: 0, author_id: @user.id)
    5.times do |i|
      Comment.create(text: "This is comment ##{i}", author_id: @user.id, post_id: @first_post.id)
    end
    visit user_post_path(@first_post.author_id, @first_post)
  end

  it 'displays the post title' do
    expect(page).to have_content('First post')
  end

  it 'displays the post body' do
    expect(page).to have_content('This is the first post')
  end

  it 'displays the post author' do
    expect(page).to have_content('by Jaime')
  end

  it 'displays the number of comments' do
    expect(page).to have_content('Comments: 5')
  end

  it 'displays the number of likes' do
    expect(page).to have_content('Likes: 0')
  end

  it 'displays the username of each comment' do
    expect(page).to have_content(@user.name)
  end

  it 'displays the body of each comment' do
    expect(page).to have_content('This is comment #0')
    expect(page).to have_content('This is comment #1')
    expect(page).to have_content('This is comment #2')
  end
end
