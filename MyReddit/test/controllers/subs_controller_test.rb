require 'test_helper'

class SubsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sub = subs(:one)
  end

  test "should get index" do
    get subs_url
    assert_response :success
  end

  test "should get new" do
    get new_sub_url
    assert_response :success
  end

  test "should create sub" do
    assert_difference('Sub.count') do
      post subs_url, params: { sub: {  } }
    end

    assert_redirected_to sub_url(Sub.last)
  end

  test "should show sub" do
    get sub_url(@sub)
    assert_response :success
  end

  test "should get edit" do
    get edit_sub_url(@sub)
    assert_response :success
  end

  test "should update sub" do
    patch sub_url(@sub), params: { sub: {  } }
    assert_redirected_to sub_url(@sub)
  end

  test "should destroy sub" do
    assert_difference('Sub.count', -1) do
      delete sub_url(@sub)
    end

    assert_redirected_to subs_url
  end
end
