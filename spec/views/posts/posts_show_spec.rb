require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.feature 'User Show', type: :feature do
  before(:each) do
    @first_user = User.create(name: 'Donard', email: 'donardgolaj@gmail.com', password: 'donard12', posts_counter: 0)
    @second_user = User.create(name: 'Paka', email: 'paka@gmail.com', password: '123456', posts_counter: 1)
    @third_user = User.create(name: 'Ahmad', email: 'ahmad@gmail.com', password: '1234ahmad', posts_counter: 3)
    @post_one = Post.create(title: 'Post 1', text: 'Content 1', comments_counter: 5, likes_counter: 1,
                            author_id: @first_user.id)
    @post_two = Post.create(title: 'Post 2', text: 'Content 2', comments_counter: 0, likes_counter: 0,
                            author_id: @first_user.id)
    @post_three = Post.create(title: 'Post 3', text: 'Content 3', comments_counter: 0, likes_counter: 0,
                              author_id: @first_user.id)
    @post_four = Post.create(title: 'Post 4', text: 'Content 4', comments_counter: 0, likes_counter: 0,
                             author_id: @first_user.id)
    5.times { |a| Comment.create(author_id: @second_user.id, post_id: @post_one.id, text: "Hello#{a}") }
    4.times { |a| Comment.create(author_id: @third_user.id, post_id: @post_three.id, text: "Comment#{a}") }
    @comment = Comment.create(author_id: @first_user.id, post_id: @post_one.id, text: 'I like it#')
    Like.create(author_id: @second_user.id, post_id: @post_three.id)
    Like.create(author_id: @second_user.id, post_id: @post_two.id)
    Like.create(author_id: @second_user.id, post_id: @post_one.id)
    visit user_session_path
    fill_in 'user[email]', with: 'donardgolaj@gmail.com'
    fill_in 'user[password]', with: 'donard12'
    click_button 'Log in'
    click_on('Donard')
    click_on('See all posts')
    click_on('Post 1')
  end

  it 'display the all posts path for first user' do
    expect(page).to have_current_path("/users/#{@first_user.id}/posts/#{@post_one.id}")
  end

  it 'display forth post title' do
    expect(page).to have_content @post_one.title
  end

  it 'display name of user who posted' do
    user = User.find(@post_one.author_id)
    expect(page).to have_content user.name
  end

  it 'display comments count' do
    expect(page).to have_content('Comment: 5')
  end

  it 'display likes count' do
    expect(page).to have_content('Likes: 1')
  end

  it 'display post body' do
    expect(page).to have_content @post_one.text
  end

  it 'display person name who commented' do
    expect(page).to have_content User.find(@comment.author_id).name
  end

  it 'display comment text' do
    expect(page).to have_content @comment.text
  end
end
# rubocop:enable Metrics/BlockLength
