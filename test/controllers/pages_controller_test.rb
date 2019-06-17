require 'test_helper'

class PagesControllerTest < ActionController::TestCase

  test "should get pages landing_page" do
    get :landing_page
    assert_response :success
  end

end