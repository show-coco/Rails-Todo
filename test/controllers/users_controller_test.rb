require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should route to new" do
    # assert_routing 'users', { controller: "users", action: "new"}
  end

  test "should routes to show" do
    # assert_routing 'users/1', { controller: "users", action: "show", id: "1" }
  end
end
