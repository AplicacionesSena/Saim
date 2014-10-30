require 'test_helper'

class PaginaControllerTest < ActionController::TestCase
  test "should get saim" do
    get :saim
    assert_response :success
  end

end
