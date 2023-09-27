require "test_helper"
include Pagy::Backend

class UsersIndexTest < ActionDispatch::IntegrationTest
  def setup 
    @user = users(:michael)
    @non_admin = users(:archer)
  end

  test "index including pagination" do
    log_in_as(@user)
    get users_path
    assert_template "users/index"
    assert_select "ul.pagination"
    _pagy, users = pagy(User, page: 1)
    users.each do |user|
      assert_select "a[href=?]", user_path(user), text: user.name
      unless user == @admin
        assert_select "form input"
      end
    end

    assert_difference 'User.count', -1 do
      delete user_path(@non_admin)
      assert_redirected_to users_url
    end

  end

  test "index as non-admin" do
    log_in_as(@non_admin)
    get users_path
    assert_select 'a', text: 'delete', count: 0
  end
end
