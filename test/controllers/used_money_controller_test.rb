require 'test_helper'

class UsedMoneyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get used_money_index_url
    assert_response :success
  end

end
