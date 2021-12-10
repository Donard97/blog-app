require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get :index' do
    get users_: index_url
    assert_response :success
  end

  test 'should get :show' do
    get users_: show_url
    assert_response :success
  end
end
