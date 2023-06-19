require 'rails_helper'

RSpec.describe 'users/index', type: :feature do
  before(:each) do
    @user = User.create(name: 'John Doe', photo: 'https://i.pravatar.cc/300', bio: 'Alien biologist', posts_counter: 1)
    @user1 = User.create(name: 'Anne', photo: 'https://i.pravatar.cc/300', bio: 'Future Chemist', posts_counter: 3)
    5.times do |i|
      Comment.create(text: "This is comment ##{i}", author_id: @user.id, post_id: @first_post.id)
    end
    visit user_index_path()
  end

  it "displays user's bio" do
    expect(page).to have_content('Alien biologist')
    expect(page).to have_content('Future Chemist')
  end

  it 'displays username' do
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user1.name)
  end

  it 'displays number of posts' do
    expect(page).to have_content('Number of Posts: 1')
    expect(page).to have_content('Number of Posts: 3')
  end

  it 'displays user profile photo' do
    expect(page).to have_css("img[src*='https://i.pravatar.cc/300']")
  end

end