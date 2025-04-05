require "test_helper"

class VisaDocumentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get visa_documents_new_url
    assert_response :success
  end

  test "should get create" do
    get visa_documents_create_url
    assert_response :success
  end

  test "should get update" do
    get visa_documents_update_url
    assert_response :success
  end
end
