require 'test_helper'

class EmergenciesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get emergencies_index_url
    assert_response :success
  end

end
