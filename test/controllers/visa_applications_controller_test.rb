require "test_helper"

class VisaApplicationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get visa_applications_new_url
    assert_response :success
  end

  test "should get create" do
    get visa_applications_create_url
    assert_response :success
  end

  test "should get update" do
    get visa_applications_update_url
    assert_response :success
  end

  test "should get show" do
    get visa_applications_show_url
    assert_response :success
  end
end
