require 'test_helper'

class PaymentControllerTest < ActionDispatch::IntegrationTest
  test "should get response" do
    get payment_response_url
    assert_response :success
  end

  test "should get confirmation" do
    get payment_confirmation_url
    assert_response :success
  end

end
