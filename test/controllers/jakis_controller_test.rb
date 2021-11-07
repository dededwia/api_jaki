require "test_helper"

class JakisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jaki = jakis(:one)
  end

  test "should get index" do
    get jakis_url, as: :json
    assert_response :success
  end

  test "should create jaki" do
    assert_difference('Jaki.count') do
      post jakis_url, params: { jaki: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show jaki" do
    get jaki_url(@jaki), as: :json
    assert_response :success
  end

  test "should update jaki" do
    patch jaki_url(@jaki), params: { jaki: {  } }, as: :json
    assert_response 200
  end

  test "should destroy jaki" do
    assert_difference('Jaki.count', -1) do
      delete jaki_url(@jaki), as: :json
    end

    assert_response 204
  end
end
