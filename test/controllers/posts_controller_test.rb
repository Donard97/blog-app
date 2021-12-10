require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test 'should get :index' do
    get posts_: index_url
    assert_response :success
  end

  test 'should get :show' do
    get posts_: show_url
    assert_response :success
  end
end
