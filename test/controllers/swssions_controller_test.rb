require 'test_helper'

class SwssionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get swssions_new_url
    assert_response :success
  end

end
