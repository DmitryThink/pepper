require 'test_helper'

class OfferControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get offer_index_url
    assert_response :success
  end

  test "should get create" do
    get offer_create_url
    assert_response :success
  end

end
