require 'test_helper'

class RequestControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get request_index_url
    assert_response :success
  end

  test 'should get show' do
    get request_show_url
    assert_response :success
  end

  test 'should get new' do
    get request_new_url
    assert_response :success
  end

  test 'should get create' do
    get request_create_url
    assert_response :success
  end
end
