require 'test_helper'

class PetsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get pets_new_url
    assert_response :success
  end

end
