require 'test_helper'

class PrototypControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get prototyp_index_url
    assert_response :success
  end

end
