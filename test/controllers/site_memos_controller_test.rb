require "test_helper"

class SiteMemosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get site_memos_index_url
    assert_response :success
  end
end
